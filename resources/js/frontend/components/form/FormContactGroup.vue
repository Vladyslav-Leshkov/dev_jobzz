<template>
    <div :class="groupClasses">
        <div class="form-control-group">

            <input :id="id || name"
                   ref="input"
                   v-model="value"
                   :class="classes"
                   :disabled="!used && !required"
                   :name="name"
                   :required="required"
                   :readonly="readonly"
                   :type="type"
                   autocomplete="off"
                   class="form-control"
                   placeholder=""
            >
            <label :for="id || name" class="form-label">{{ label }} <span v-if="required"
                                                                          class="text-danger">*</span></label>
            <div v-if="errorMessage" class="form-error position-absolute mt-0 right-0 font-12">{{ errorMessage }}</div>
            <label v-if="!required" class="check">
                <input v-model="used" :name="'use['+name+']'" :value="value" type="checkbox" @change="onUsedChange">
                <span></span>
            </label>
        </div>
    </div>
</template>

<script>
import {computed, ref, watch} from "vue";
import {useField} from "vee-validate";
import {formFieldClasses, formGroupClasses} from "./useFromGroup";

export default {
    name: "FormContactGroup",
    props: {
        name: String,
        label: String,
        id: [String, null],
        filedValue: [String, Number, null],
        usedValue: {
            type: Boolean,
            default: true,
        },
        required: {
            type: Boolean,
            default: false,
        },
        readonly: {
            type: Boolean,
            default: false,
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
    },
    emits: ['update:filedValue', 'update:usedValue'],
    setup({name, rules, filedValue, usedValue}, {emit}) {
        const input = ref(null);
        const used = ref(usedValue);

        const {errorMessage, value, meta} = useField(name, rules, {
            initialValue: filedValue,
            validateOnMount: false
        });

        const classes = computed(() => formFieldClasses(meta));

        const groupClasses = computed(() => [...formGroupClasses(meta), 'form-floating form-contact-group']);

        const onUsedChange = (e) => emit('update:usedValue', e.target.checked);

        watch(value, (val) => emit('update:filedValue', val));

        return {
            input,
            errorMessage,
            value,
            groupClasses,
            classes,
            used,
            onUsedChange,
        }
    },

}
</script>

<style scoped>

</style>
