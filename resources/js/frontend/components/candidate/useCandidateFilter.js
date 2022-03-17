import { useFormDataProperty} from "../../store/composables/useFormData";


/**
 *
 * @returns {{}}
 */
export const useCandidateFilter = () => {
    const namespace = 'candidateFilter';
    return {
        q: useFormDataProperty('q', namespace),
        spec: useFormDataProperty('spec', namespace),
        empl: useFormDataProperty('empl', namespace),
        cid: useFormDataProperty('cid', namespace),
        exp: useFormDataProperty('exp', namespace),
        eng: useFormDataProperty('eng', namespace),
        sal: useFormDataProperty('sal', namespace),
        sal_from: useFormDataProperty('sal_from', namespace),
        sal_to: useFormDataProperty('sal_to', namespace),
    }
}
