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
            remotely: 0,
            is_product: 0,
            relocate: 0,
            help_relocate: 0,
        },
    }),
    mutations: {
        UPDATE_FORM_DATA (state, value) {
            Object.assign(state.formData, value);
        },
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
        is_product(state) {
            return state.formData.is_product
        },
        relocate(state) {
            return state.formData.relocate
        },
        help_relocate(state) {
            return state.formData.help_relocate
        },
        remotely(state) {
            return state.formData.remotely
        },
        formData(state){
            return {
                q: state.formData.q || null,
                spec: state.formData.spec.length ? state.formData.spec.join(',') : null,
                empl: state.formData.empl.length ? state.formData.empl.join(',') : null,
                cid: state.formData.cid.length ? state.formData.cid.join(',') : null,
                exp: state.formData.exp.length ? state.formData.exp.join('|') : null,
                eng: state.formData.eng.length ? state.formData.eng.join(',') : null,
                sal: state.formData.sal > 0 ? state.formData.sal : null,
                is_product: state.formData.is_product > 0 ? 1 : null,
                relocate: state.formData.relocate > 0 ? 1 : null,
                help_relocate: state.formData.help_relocate > 0 ? 1 : null,
                remotely: state.formData.remotely > 0 ? 1 : null,
            };
        }
    }
}
