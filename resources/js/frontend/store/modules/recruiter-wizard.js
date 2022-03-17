export default {
    namespaced: true,
    state: () => ({
        formData: {
            description: '',
            first_name: '',
            last_name: '',
            position: '',
            title: '',
            linked_in: '',
            telegram: '',
            website: '',
            address: '',
            phone: '',
            email: '',
            avatar: '',
            logo: '',
            is_product: 0,
        }
    }),
    mutations: {
        UPDATE_FORM_DATA (state, value) {
            Object.assign(state.formData, value);
        }
    },
    getters: {
        description(state) {
            return state.formData.description
        },
        first_name(state) {
            return state.formData.first_name
        },
        last_name(state) {
            return state.formData.last_name
        },
        position(state) {
            return state.formData.position
        },
        title(state) {
            return state.formData.title
        },
        linked_in(state) {
            return state.formData.linked_in
        },
        telegram(state) {
            return state.formData.telegram
        },
        website(state) {
            return state.formData.website
        },
        address(state) {
            return state.formData.address
        },
        phone(state) {
            return state.formData.phone
        },
        email(state) {
            return state.formData.email
        },
        avatar(state) {
            return state.formData.avatar
        },
        logo(state) {
            return state.formData.logo
        },
        is_product(state) {
            return state.formData.is_product
        },
    }
}
