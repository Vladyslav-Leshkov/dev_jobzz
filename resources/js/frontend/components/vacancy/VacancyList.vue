<template>
    <div class="items-list mw-1020">
        <spinner v-if="loading && items.length === 0" class="mx-auto"/>
        <div :class="{loading: loading}">
            <vacancy-card v-for="item in items"
                          :key="'item-'+item.id"
                          :item="item"
                          class="mb-20 profile-card"
            ></vacancy-card>
        </div>
        <pagination v-if="lastPage > 1" v-model="currentPage" :last-page="lastPage" class="py-30"></pagination>

        <div v-if="!loading && items.length === 0" class="alert alert-secondary text-center font-16">
            {{ __('No vacancies found for the specified parameters') }}
        </div>
    </div>
</template>

<script>
import Spinner from "../common/Spinner";
import {useStore} from "vuex";
import {computed, ref, watch} from "vue";
import VacancyCard from "./VacancyCard";
import Pagination from "../common/Pagination";
import {scrollTo} from "../../../utils/functions";
import * as URLUtils from "../../../utils/url";

export default {
    name: "VacancyList",
    components: {Pagination, VacancyCard, Spinner},
    props: {
        filter: {
            type: Object
        },
        page: {
            type: Number,
            default: 1,
        }
    },
    setup({filter, page}) {
        const store = useStore();
        const inited = ref(false);

        if (page > 0) {
            store.commit('vacancyList/SET_CURRENT_PAGE', page);
        }

        if (filter) {
            const data = {
                q: filter.q || '',
                spec: filter.spec ? filter.spec.split(',').map(v => parseInt(v)) : [],
                empl: filter.empl ? filter.empl.split(',').map(v => parseInt(v)) : [],
                cid: filter.cid ? filter.cid.split(',').map(v => parseInt(v)) : [],
                exp: filter.exp ? filter.exp.split('|') : [],
                eng: filter.eng ? filter.eng.split(',').map(v => parseInt(v)) : (filter.min_eng ? [filter.min_eng] : []),
                sal: filter.sal ? filter.sal : 0,
                remotely: filter.remotely ? 1 : 0,
                is_product: filter.is_product ? 1 : 0,
                relocate: filter.relocate ? 1 : 0,
                help_relocate: filter.help_relocate ? 1 : 0,
            };
            store.commit('vacancyFilter/UPDATE_FORM_DATA', data);
        }


        const currentPage = computed({
            get() {
                return store.state.vacancyList.current_page;
            },
            set(val) {
                store.commit('vacancyList/SET_CURRENT_PAGE', val);
            }
        });

        const lastPage = computed(() => store.state.vacancyList.last_page);
        const items = computed(() => store.state.vacancyList.data);
        const loading = computed(() => store.state.vacancyList.loading);
        const formData = computed(() => store.getters["vacancyFilter/formData"]);

        const loadItems = async (params) => {
            await store.dispatch('vacancyList/loadItems', params);
        }


        loadItems({...formData.value, page: page || 1});

        watch(formData, _.debounce(function (newVal, oldVal) {
            if (inited.value) {
                loadItems({...newVal, page: 1});
            }

        }, 500));

        watch(currentPage, _.debounce(function (newVal, oldVal) {
            if (newVal !== oldVal && inited.value) {
                loadItems({...formData.value, page: currentPage.value});

                scrollTo('.page-container', -80);
            }
        }, 300));

        inited.value = true;

        return {
            items,
            loading,
            currentPage,
            lastPage,
        }
    }
}
</script>

<style scoped>

</style>
