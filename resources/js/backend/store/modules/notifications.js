import {axiosGet, axiosPost} from "../../../frontend/services/api";

export default {
    namespaced: true,
    state: () => ({
        messages: [],
    }),
    mutations: {
        SET_MESSAGES(state, messages){
            state.messages = messages;
        },
        ADD_MESSAGE(state, message){
            state.messages.unshift(message);
        }
    },
    actions: {
        async loadMessages({commit}) {
            const data = await axiosGet('/api/notifications');
            if (data) {
                commit('SET_MESSAGES', data);
            }
        },
        async markRead({commit, state}, id) {
            await axiosPost('/api/notifications/' + id + '/mark-read');
            const messages = state.messages.filter(m => m.id !== id);
            commit('SET_MESSAGES', messages);
        }
    }
}
