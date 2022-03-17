export default {
    namespaced: true,
    state: () => ({
        formData: {
            q: '',
            spec: [],
            empl: [],
            cid: [],
            exp: [],
            eng: [],
            sal: 0,
            sal_from: 0,
            sal_to: 1000000,
        },
    }),
    mutations: {
        UPDATE_FORM_DATA (state, value) {
            Object.assign(state.formData, value);
        }
    },
    getters: {
        q (state) {
            return state.formData.q
        },
        spec(state) {
            return state.formData.spec
        },
        empl(state) {
            return state.formData.empl
        },
        cid (state) {
            return state.formData.cid
        },
        exp(state) {
            return state.formData.exp
        },
        eng(state) {
            return state.formData.eng
        },
        sal(state) {
            return state.formData.sal
        },
        sal_from(state) {
            return state.formData.sal_from
        },
        sal_to(state) {
            return state.formData.sal_to
        },
        formData(state){
            return {
                q: state.formData.q || null,
                spec: state.formData.spec.length ? state.formData.spec.join(',') : null,
                empl: state.formData.empl.length ? state.formData.empl.join(',') : null,
                cid: state.formData.cid.length ? state.formData.cid.join(',') : null,
                exp: state.formData.exp.length ? state.formData.exp.join(',') : null,
                eng: state.formData.eng.length ? state.formData.eng.join(',') : null,
                sal: state.formData.sal > 0 ? state.formData.sal : null,
                sal_from: state.formData.sal_from > 0 ? state.formData.sal_from : null,
                sal_to: state.formData.sal_to < 1000000 ? state.formData.sal_to : null,
                remotely: state.formData.empl.indexOf(2) !== -1 ? 1 : null,
            };
        }
    }
}
