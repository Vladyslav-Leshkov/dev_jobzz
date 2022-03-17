<template>
    <div>
        <div class="row mb-3">
            <div class="col-12 col-lg-6">
                <input type="text" class="form-control" name="q" v-model="q" v-debounce="500"

                       placeholder="Поиск...">
            </div>
            <div class="col-12 col-lg-6">
                <div class="form-group d-inline-flex align-items-center">
                    <label for="group" class="me-2">Группа</label>
                    <select name="group" id="group" class="form-control" v-model="group" @change="filterChange()">
                        <option value="">Не выбрана</option>
                        <option v-for="group in groups" :value="group">{{ group.replaceAll('-', ' ') }}</option>
                    </select>
                </div>

            </div>
        </div>

        <div class="list-group mb-3">
            <translation-item v-for="item in items"
                              :item="item"
                              :locales="locales"
                              :key="'ll-'+item.id"
                              @edit="editItem(item)"
            />

        </div>
        <pagination :links="links" @change="changePage"/>
        <teleport to="body">
            <translation-edit-modal :item="selectedItem" @save="saveItem" :locales="locales" ref="editModalRef"/>
        </teleport>
    </div>
</template>

<script>
import {computed, ref, watch} from "vue";
import Pagination from "../../../backend/components/common/Pagination";
import axios from "axios";
import * as UrlUtils from "../../../utils/url";
import TranslationEditModal from "./TranslationEditModal";
import TranslationItem from "./TranslationItem";
import {toast} from "../../../modules/toast";

let cancelTokenSource = null;

export default {
    name: "TranslationEditor",
    components: {TranslationItem, TranslationEditModal, Pagination},
    props: {
        params: Object,
        groups: Array,
        locales: Array,
    },
    setup(props) {
        const editModalRef = ref(null);
        const q = ref(decodeURIComponent(props.params.q || ''));
        const group = ref(props.params.group || '');
        const order = ref(props.params.order || 'key:asc');
        const loading = ref(false);
        const items = ref([]);
        const links = ref([]);
        const currentPage = ref(props.params.page || 1);

        const selectedItem = ref({
            id: 0,
            key: '*',
            text: {
                ru: '',
                en: '',
            },
        });

        const defaultFilter = computed(() => {
            return {
                q: '',
                group: '',
                order: 'key:asc',
                page: 1,
            }
        });

        const filterData = computed(() => {
            return {
                q: q.value,
                group: group.value,
                order: order.value,
                page: currentPage.value,
            }
        });


        const filterChange = () => {
            currentPage.value = 1;
            loadItems();
        }

        const editItem = (item) => {
            selectedItem.value = {...item, text: {...item.text}};
            editModalRef.value.show();
        }

        const saveItem = (item) => {
            if (item.id > 0) {
                axios.patch(`/admin/translation/` + item.id, {
                    text: item.text,
                }).then(({data}) => {
                    if (data.result === 'success') {
                        const idx = items.value.findIndex(it => it.id === item.id);
                        items.value[idx] = data.model;
                        toast.success('Запись обновлена');
                    }
                }).catch(error => {
                    console.log(error);
                    toast.error(error.message);
                })
            } else {
                axios.post(`/admin/translation`, {
                    group: item.group,
                    key: item.key,
                    text: item.text,
                }).then(() => {
                    loadItems(false);
                    toast.success('Запись создана');
                }).catch(error => {
                    console.log(error);
                    toast.error(error.message);
                })
            }
        }

        const changePage = (page) => {
            console.log(page);
            currentPage.value = page;
            loadItems();
        }

        const loadItems = (updateUrl = true) => {
            if (cancelTokenSource) {
                cancelTokenSource.cancel();
            }
            cancelTokenSource = axios.CancelToken.source();
            loading.value = true;
            const params = filterData.value;

            if (updateUrl) {
                const updateParams = UrlUtils.filterParams(params, defaultFilter.value);
                UrlUtils.updateUrl(document.location.pathname, updateParams, false);
            }

            axios.get('', {
                    cancelToken: cancelTokenSource.token,
                    params: params
                })
                .then(({data: response}) => {
                    items.value = response.data;
                    links.value = response.links;
                    loading.value = false;
                })
                .catch(error => {
                    console.log(error);
                    loading.value = false;
                })
        }

        loadItems(false);

        watch(q, filterChange);

        return {
            q,
            group,
            items,
            links,
            editItem,
            saveItem,
            filterChange,
            changePage,
            currentPage,
            editModalRef,
            selectedItem,
        }
    }
}
</script>

<style scoped>

</style>