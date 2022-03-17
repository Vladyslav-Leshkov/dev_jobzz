<template>
    <div :class="groupClasses">

        <div v-if="!floating && label" :for="name" class="form-label" :class="{required: required}">{{label}}</div>
        <div class="form-control-group" :class="{selected: selected}">
            <form-select v-model="value"
                         :name="name"
                         :title="placeholder"
                         :options="options"
                         :class="classes"
            ></form-select>
            <div v-if="floating && label" :for="name" class="form-label" :class="{required: required}">{{label}}</div>
            <div class="form-note" v-if="notes">{{ notes }}</div>
            <div class="form-error" v-if="errorMessage">{{ errorMessage }}</div>
            <div class="form-text" v-if="formText && !errorMessage">{{ formText }}</div>
        </div>

    </div>
</template>

<script>
import {usePasswordFormGroup, formGroupClasses, useRequiredFormGroup, formFieldClasses} from './useFromGroup';
import {useField} from "vee-validate";
import {computed, onMounted, ref, toRefs, watch} from "vue";
import IMask from 'imask';
import FormSelect from "./FormSelect";

export default {
    name: "SelectFormGroup",
    components: {FormSelect},
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

        modelValue: [String, Number, null],
        floating: {
            type: Boolean,
        },
        options: {
            type: Array,
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

        const selected= computed(()=>{
            return Array.isArray(value.value) ? value.value.length : !!value.value;
        });

        return {
            input,
            errorMessage,
            value,
            classes,
            groupClasses,
            selected,
            ...useRequiredFormGroup(rules),
            ...usePasswordFormGroup(type),
        };
    },
}
</script>

<style scoped>

</style>
