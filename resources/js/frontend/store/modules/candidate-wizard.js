const CANDIDATE_WIZARD_DEFAULT = {
    employment_types: [],
    cities: [],
    specializations: [],
    position: '',
    experience: 0,
    price_full_time: 0,
    price_freelance: 0,
    english_level: 0,
    // Step 2
    skills: [],
    additional_skills: [],
    description: '',
    first_name: '',
    last_name: '',
    linked_in: '',
    resume: '',
    resume_upload: null,
    avatar: '',
    avatar_upload: null,
}

export default {
    namespaced: true,
    state: () => ({
        step: 0,
        preview: false,
        formData: Object.assign({}, CANDIDATE_WIZARD_DEFAULT),
    }),
    mutations: {
        SET_STEP(state, value) {
            state.step = value;
        },
        SET_PREVIEW(state, value) {
            state.preview = value;
        },
        UPDATE_FORM_DATA(state, value) {
            Object.assign(state.formData, value);
        },
        RESET(state) {
            state.step = 0;
            Object.assign(state.formData, CANDIDATE_WIZARD_DEFAULT);
        }

    },
    getters: {
        currentStep(state) {
            return state.step + 1;
        },
        employment_types(state) {
            return state.formData.employment_types
        },
        cities(state) {
            return state.formData.cities
        },
        specializations(state) {
            return state.formData.specializations
        },
        position(state) {
            return state.formData.position
        },
        experience(state) {
            return state.formData.experience
        },
        price_full_time(state) {
            return state.formData.price_full_time
        },
        price_freelance(state) {
            return state.formData.price_freelance
        },
        english_level(state) {
            return state.formData.english_level
        },
        skills(state) {
            return state.formData.skills
        },
        additional_skills(state) {
            return state.formData.additional_skills
        },
        description(state) {
            return state.formData.description
        },
        first_name(state) {
            return state.formData.first_name
        },
        last_name(state) {
            return state.formData.last_name
        },
        linked_in(state) {
            return state.formData.linked_in
        },
        avatar(state) {
            return state.formData.avatar
        },
        avatar_upload(state) {
            return state.formData.avatar_upload
        },
        resume(state) {
            return state.formData.resume
        },
        resume_upload(state) {
            return state.formData.resume_upload
        },
    }
}
