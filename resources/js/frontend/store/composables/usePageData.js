import {axiosGet} from "../../services/api";
import axios from 'axios';
import * as URLUtils from "../../../utils/url";

let loadRequestSource = axios.CancelToken.source();

export const usePageData = (baseUrl) => {
    return {
        namespaced: true,
        state: () => ({
            loading: false,
            current_page: 1,
            data: [],
            from: 0,
            last_page: 1,
            per_page: 20,
            to: 0,
            total: 0,
        }),
        mutations: {
            SET_LOADING(state, value) {
                state.loading = value;
            },
            SET_CURRENT_PAGE(state, value) {
                state.current_page = value;
            },
            SET_LAST_PAGE(state, value) {
                state.last_page = value;
            },
            SET_TOTAL(state, value) {
                state.total = value;
            },
            SET_PAGE_DATA(state, data) {
                Object.assign(state, data);
            },
            SET_ITEMS(state, items) {
                state.data = items;
            }
        },
        actions: {
            async loadItems({commit}, params) {
                commit('SET_LOADING', true);
                try {
                    loadRequestSource.cancel('abort');
                } catch (e) {
                }
                loadRequestSource = axios.CancelToken.source();
                const response = await axiosGet(baseUrl, {
                    params: params,
                    cancelToken: loadRequestSource.token
                });
                if (response !== null) {
                    const items = response.data;
                    delete response.data;
                    commit('SET_PAGE_DATA', response);
                    commit('SET_ITEMS', items);
                }
                URLUtils.setUrlQuery({...params, page: params.page > 1 ? params.page : null});
                commit('SET_LOADING', false);
                return response;
            }
        }
    }
}
