import {computed, inject} from "vue";
import {useStore} from "vuex";
import {useFormDataProperty} from "../../store/composables/useFormData";


export const useIsFreelanceSelected = (namespace) => {
    const wizard_options = inject("WIZARD_OPTIONS");
    const options = wizard_options.employment_types || [];
    const freelanceOptions = options.filter(o => o.freelance).map(o => o.id);
    const employment_types = useFormDataProperty('employment_types', namespace);
    const isFreelanceSelected = computed(() => freelanceOptions.some(id => employment_types.value.includes(id)));
    return {
        isFreelanceSelected
    }
}


export const useWizardAvatar = (namespace) => {
    const store = useStore();

    return {
        onAvatarChange: ({src}) => {
            store.commit(namespace + '/UPDATE_FORM_DATA', {avatar: src});
        },
        avatar: useFormDataProperty('avatar', namespace),
    }
}

export const useWizardResume = (namespace) => {
    const store = useStore();

    return {
        onResumeChange: ({resume}) => {
            store.commit(namespace + '/UPDATE_FORM_DATA', {resume: resume});
        },
        resume: useFormDataProperty('resume', namespace),
    }
}

export const useWizardLogo = (namespace) => {
    const store = useStore();

    return {
        onLogoChange: ({src}) => {
            store.commit(namespace + '/UPDATE_FORM_DATA', {logo: src});
        },
        logo: useFormDataProperty('logo', namespace),
    }
}

export const useWizardPreview = (namespace) => {
    const store = useStore();
    return {
        preview: computed({
            get() {
                return store.state[namespace].preview
            },
            set(newValue) {
                store.commit(namespace + '/SET_PREVIEW', newValue);
            },
        })
    }
}

export const useWizardCurrentStepIdx = (namespace) => {
    const store = useStore();
    return {
        currentStepIdx: computed({
            get() {
                return store.state[namespace].step
            },
            set(newValue) {
                store.commit(namespace + '/SET_STEP', newValue);
            },
        })
    }
}


export const useWizardOptions = (optionsName) => {
    const wizard_options = inject("WIZARD_OPTIONS");
    if (Array.isArray(optionsName)) {
        const res = {};
        optionsName.forEach(name => {
            res[name] = wizard_options[name] || []
        });
        return res;
    } else {

        const options = wizard_options[optionsName] || [];
        return {
            [optionsName]: options,
        }
    }
}

export const useWizardRecruiter = (namespace) => {
    return {
        first_name: useFormDataProperty('first_name', namespace),
        last_name: useFormDataProperty('last_name', namespace),
        title: useFormDataProperty('title', namespace),
        phone: useFormDataProperty('phone', namespace),
        email: useFormDataProperty('email', namespace),
        position: useFormDataProperty('position', namespace),
        description: useFormDataProperty('description', namespace),
        linked_in: useFormDataProperty('linked_in', namespace),
        telegram: useFormDataProperty('telegram', namespace),
        website: useFormDataProperty('website', namespace),
        address: useFormDataProperty('address', namespace),
        is_product: useFormDataProperty('is_product', namespace),
        ...useWizardAvatar(namespace),
        ...useWizardLogo(namespace),
    }
}

export const useWizardCandidate = (namespace) => {
    return {
        employment_types: useFormDataProperty('employment_types', namespace),
        cities: useFormDataProperty('cities', namespace),
        specializations: useFormDataProperty('specializations', namespace),
        position: useFormDataProperty('position', namespace),
        experience: useFormDataProperty('experience', namespace),
        price_full_time: useFormDataProperty('price_full_time', namespace),
        price_freelance: useFormDataProperty('price_freelance', namespace),
        english_level: useFormDataProperty('english_level', namespace),
        skills: useFormDataProperty('skills', namespace),
        additional_skills: useFormDataProperty('additional_skills', namespace),
        description: useFormDataProperty('description', namespace),
        first_name: useFormDataProperty('first_name', namespace),
        last_name: useFormDataProperty('last_name', namespace),
        linked_in: useFormDataProperty('linked_in', namespace),
        ...useWizardAvatar(namespace),
        ...useWizardResume(namespace),
        ...useWizardPreview(namespace),
    }
}





