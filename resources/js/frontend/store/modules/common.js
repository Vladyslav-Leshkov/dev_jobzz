export default {
    namespaced: true,
    state: () => ({
        locale: 'ru',
    }),
    mutations: {
        SET_LOCALE(state, value) {
            state.locale = value;
        }
    },
}
