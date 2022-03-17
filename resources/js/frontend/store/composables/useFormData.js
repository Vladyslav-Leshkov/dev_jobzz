import {useStore} from "vuex";
import {computed, inject} from "vue";

export const useFormData = (namespace) => {
    const store = useStore();
    if(namespace === null){
        namespace = inject("STORE_NAMESPACE");
    }

    return computed({
        get() {
            return store.state[namespace].formData
        },
        set(data){
            store.commit(namespace+'/UPDATE_FORM_DATA', data);
        }
    });
}


export const useFormDataProperty = (optionName, namespace) => {
    const store = useStore();
    if(namespace === null){
        namespace = inject("STORE_NAMESPACE");
    }

    return  computed({
        get() {
            return store.getters[namespace+'/'+optionName]
        },
        set(newValue){
            store.commit(namespace+'/UPDATE_FORM_DATA', {[optionName]: newValue})
        }
    });
}

