<template>
    <div :class="groupClasses">

        <label v-if="!floating && label" :for="name" class="form-label" :class="{required: required}">{{label}}</label>
        <div class="form-control-group">
            <input  class="form-control"
                    ref="input"
                    :type="innerType"
                    :id="name"
                    :name="name"
                    v-model="value"
                    :placeholder="floating ? ' ' : placeholder"
                    :readonly="readonly"
                    :class="classes"
                    :autocomplete="autocomplete"
            />
            <label v-if="floating && label" :for="name" class="form-label" :class="{required: required}">{{label}}</label>
            <div class="form-note" v-if="notes">{{ notes }}</div>
            <div class="form-error" v-if="errorMessage">{{ errorMessage }}</div>
            <div class="form-text" v-if="formText && !errorMessage">{{ formText }}</div>
        </div>



        <a href="#" @click.prevent="switchPasswordType" v-if="type === 'password'" class="password-icon"
           :class="{view: innerType === 'text'}"></a>
    </div>
</template>

<script>
import {usePasswordFormGroup, formGroupClasses, useRequiredFormGroup, formFieldClasses} from './useFromGroup';
import {useField} from "vee-validate";
import {computed, onMounted, ref, toRefs, watch} from "vue";
import IMask from 'imask';

export default {
    name: "TextFormGroup",
    props: {
        label: {
            type: String,
        },
        name: {
            type: String,
            required: true,
        },
        placeholder: {
            type: String,
        },
        notes: {
            type: String,
            default: ''
        },
        formText: {
            type: String,
            default: ''
        },
        mask: {
            type: String,
            default: ''
        },
        modelValue: [String, Number, null],
        floating: {
            type: Boolean,
        },
        type: {
            type: String,
            default: "text",
            validator(value) {
                return [
                    "url",
                    "text",
                    "password",
                    "tel",
                    "search",
                    "number",
                    "email",
                ].includes(value);
            }
        },
        rules: {
            type: [String, Object],
            default: ''
        },
        autocomplete: {
            type: String,
            default: 'off'
        },
        readonly: Boolean,
    },
    emits: ['update:modelValue'],
    setup({type, name, rules, modelValue, floating, mask}, {emit}) {
        const input = ref(null);
        const { errorMessage, value, meta } = useField(name, rules, {
            initialValue: modelValue,
            validateOnMount: false
        });

        watch(value, (val)=> emit('update:modelValue', val));

        const classes = computed(()=> formFieldClasses(meta));

        const groupClasses = computed(()=> [...formGroupClasses(meta), floating ? 'form-floating' : 'form-group']);

        onMounted(()=>{
            if(mask){
                IMask(input.value, {
                    mask: mask,
                });
            }
        });

        return {
            input,
            errorMessage,
            value,
            classes,
            groupClasses,
            ...useRequiredFormGroup(rules),
            ...usePasswordFormGroup(type),
        };
    },
}
</script>

<style scoped>

</style>
