
import {ref} from 'vue';




export const formGroupClasses = (meta) => {
    const {valid, dirty, validated} = meta;
    const classNames = [];
    if(valid && (dirty || validated)){
        classNames.push('is-valid-group');
    }
    if(!valid && (dirty || validated)){
        classNames.push('is-invalid-group');
    }
    return classNames;
}

export const formFieldClasses = (meta) => {
    const {valid, dirty, validated} = meta;
    const classNames = [];
    if(valid && (dirty || validated)){
        classNames.push('is-valid');
    }
    if(!valid && (dirty || validated)){
        classNames.push('is-invalid');
    }
    return classNames;
}

export const useRequiredFormGroup = (rules)=>{
    rules = typeof(rules) === 'object' ? Object.keys(rules) : rules.split('|');
    const required = rules.indexOf('required') !== -1;
    return {
        required
    }
}

export const usePasswordFormGroup = (type)=>{
    const innerType = ref(type);
    const switchPasswordType =  () => {
        innerType.value = innerType.value === 'password' ? 'text' : 'password';
    }
    return {
        innerType,
        switchPasswordType,
    }
}

