import { useFormDataProperty} from "../../store/composables/useFormData";

/**
 *
 * @returns {{}}
 */
export const useVacancyFilter = () => {
    const namespace = 'vacancyFilter';
    return {
        q: useFormDataProperty('q', namespace),
        spec: useFormDataProperty('spec', namespace),
        empl: useFormDataProperty('empl', namespace),
        cid: useFormDataProperty('cid', namespace),
        exp: useFormDataProperty('exp', namespace),
        eng: useFormDataProperty('eng', namespace),
        sal: useFormDataProperty('sal', namespace),
        is_product: useFormDataProperty('is_product', namespace),
        relocate: useFormDataProperty('relocate', namespace),
        help_relocate: useFormDataProperty('help_relocate', namespace),
        remotely: useFormDataProperty('remotely', namespace),
    }
}
