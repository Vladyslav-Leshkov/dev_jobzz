<template>
    <div :class="groupClasses">
        <div v-if="label" :class="{required: required}" class="form-label">{{ label }}</div>
        <div class="form-control-group">
            <input v-if="!checked" :name="name" :value="inactiveValue" type="hidden">
            <div class="form-switch">
                <input :id="name" ref="input"
                       v-model="checked"
                       :disabled="disabled"
                       :name="name"
                       :value="activeValue"
                       class="form-check-input"
                       type="checkbox"
                >
                <div class="form-check-label">{{ checked ? activeText : inactiveText }}</div>
            </div>
            <div v-if="notes" class="form-note">{{ notes }}</div>
            <div v-if="errorMessage" class="form-error">{{ errorMessage }}</div>
        </div>
    </div>
</template>

<script>
import {formFieldClasses, formGroupClasses, useRequiredFormGroup} from './useFromGroup';
import {useField} from "vee-validate";
import {computed, ref, watch} from "vue";

export default {
    name: "SwitchFormGroup",
    props: {
        label: {
            type: String,
        },
        name: {
            type: String,
            required: true,
        },
        notes: {
            type: String,
            default: ''
        },
        activeText: {
            type: String,
            default: ''
        },
        inactiveText: {
            type: String,
            default: ''
        },
        modelValue: [String, Number, null],
        rules: {
            type: [String, Object],
            default: ''
        },
        activeValue: {
            type: [String, Object, Number, Boolean],
            default: true,
        },
        inactiveValue: {
            type: [String, Object, Number, Boolean],
            default: false,
        },
        disabled: {
            type: Boolean,
            default: false,
        }
    },
    emits: ['update:modelValue'],
    setup({type, name, rules, modelValue, activeValue, inactiveValue}, {emit}) {
        const input = ref(null);
        const {errorMessage, value: checked, meta} = useField(name, rules, {
            initialValue: modelValue === activeValue,
            validateOnMount: false
        });

        watch(checked, (val) => emit('update:modelValue', val ? activeValue : inactiveValue));

        const classes = computed(() => formFieldClasses(meta));

        const groupClasses = computed(() => [...formGroupClasses(meta), 'form-group']);

        return {
            input,
            errorMessage,
            checked,
            classes,
            groupClasses,
            ...useRequiredFormGroup(rules),
        };
    },
}
</script>

<style scoped>

</style>
