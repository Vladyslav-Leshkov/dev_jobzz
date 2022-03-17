<template>
    <div class="items-list mw-1020">
        <spinner v-if="loading && items.length === 0"/>

        <div :class="{loading: loading}">
            <candidate-card v-for="item in items"
                            :key="'item-'+item.id"
                            :item="item"
                            class="mb-20 profile-card"
            ></candidate-card>
        </div>
        <pagination v-if="lastPage > 1" v-model="currentPage" :last-page="lastPage" class="py-30"></pagination>
        <div v-if="!loading && items.length === 0" class="alert alert-secondary text-center font-16">
            {{ __('No candidates found for the specified parameters') }}
        </div>
    </div>
</template>

<script>
import {computed, nextTick, ref, watch} from "vue";
import Spinner from "../common/Spinner";
import {useStore} from "vuex";
import CandidateCard from "./CandidateCard";
import Pagination from "../common/Pagination";
import {scrollTo} from "../../../utils/functions";
import * as URLUtils from "../../../utils/url";
import {setUrlQuery, updateUrl} from "../../../utils/url";

export default {
    name: "CandidateList",
    components: {Pagination, CandidateCard, Spinner},
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
            store.commit('candidateList/SET_CURRENT_PAGE', page);
        }
        console.log(filter);
        if (filter) {
            const data = {
                q: filter.q || '',
                spec: filter.spec ? filter.spec.split(',').map(v => parseInt(v)) : [],
                empl: filter.empl ? filter.empl.split(',').map(v => parseInt(v)) : [],
                cid: filter.cid ? filter.cid.split(',').map(v => parseInt(v)) : [],
                exp: filter.exp ? filter.exp.split('|') : [],
                eng: filter.eng ? filter.eng.split(',').map(v => parseInt(v)) : (filter.min_eng ? [filter.min_eng] : []),
                sal: filter.sal ? filter.sal : 0,
                sal_from: filter.sal_from ? parseInt(filter.sal_from) : 0,
                sal_to: filter.sal_to ? parseInt(filter.sal_to) : 1000000,
                remotely: filter.remotely ? 1 : 0,
            }
            store.commit('candidateFilter/UPDATE_FORM_DATA', data);
        }

        const currentPage = computed({
            get() {
                return store.state.candidateList.current_page;
            },
            set(val) {
                store.commit('candidateList/SET_CURRENT_PAGE', val);
            }
        });

        const items = computed(() => store.state.candidateList.data);
        const loading = computed(() => store.state.candidateList.loading);
        const lastPage = computed(() => store.state.candidateList.last_page);
        const formData = computed(() => store.getters["candidateFilter/formData"]);

        const loadItems = async (params) => {
            await store.dispatch('candidateList/loadItems', params);
        }

        loadItems({...formData.value, page: page});

        watch(formData, _.debounce(function (newVal, oldVal) {
            if (inited.value) {
                nextTick(() => {
                    loadItems({...newVal, page: 1});
                })
            }

        }, 500));

        watch(currentPage, _.debounce(function (newVal, oldVal) {
            if (newVal !== oldVal && inited.value) {
                nextTick(() => {
                    loadItems({...formData.value, page: currentPage.value});
                    scrollTo('.page-container', -80);
                })
            }
        }, 500));

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
