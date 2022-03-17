<template>
    <div class="datepicker"  :class="groupClasses">
        <label v-if="!floating && label" :for="name" class="form-label" :class="{required: required}">{{label}}</label>
        <div class="form-control-group">
            <input type="text"
                   class="form-control"
                   ref="element"
                   :id="name"
                   :name="name"
                   :value="value"
                   :placeholder="floating ? ' ' : placeholder"
                   :readonly="readonly"
                   :class="classes"
                   @change="onChange"
            >
            <label v-if="floating && label" :for="name" class="form-label" :class="{required: required}">{{label}}</label>
            <div class="form-note" v-if="notes">{{ notes }}</div>
            <div class="form-error" v-if="errorMessage">{{ errorMessage }}</div>
            <div class="form-text" v-if="formText && !errorMessage">{{ formText }}</div>
        </div>
    </div>
</template>

<script>
import {computed, onMounted, ref, watch} from "vue";
import flatpickr from "flatpickr";
import {Russian} from "flatpickr/dist/l10n/ru";
import {useField} from "vee-validate";
import {formFieldClasses, formGroupClasses, useRequiredFormGroup} from "./useFromGroup";

export default {
    name: "FormDatepicker",
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
        floating: {
            type: Boolean,
        },
        readonly: {
            type: Boolean,
        },
        allowInput: {
            type: Boolean,
        },
        rules: {
            type: [String, Object],
            default: ''
        },
        modelValue: {
            validator(value) {
                return (
                    value === null ||
                    value instanceof Date ||
                    typeof value === 'string' ||
                    value instanceof String ||
                    typeof value === 'number'
                );
            }
        },
        dateFormat: {
            type: String,
            default: 'Z'
        },
        minDate: {
            validator(value) {
                return (
                    value === null ||
                    value instanceof Date ||
                    typeof value === 'string' ||
                    value instanceof String ||
                    typeof value === 'number'
                );
            },
            default: null
        },
        maxDate: {
            validator(value) {
                return (
                    value === null ||
                    value instanceof Date ||
                    typeof value === 'string' ||
                    value instanceof String ||
                    typeof value === 'number'
                );
            },
            default: null
        }
    },
    emits:['update:modelValue'],
    setup(props, {emit}){
        const element = ref(null);
        const fp = ref(null);
        const { errorMessage, value, meta } = useField(props.name, props.rules, {
            initialValue: props.modelValue,
            validateOnMount: false
        });

        watch(()=>props.modelValue, (val)=> {
            if(val !== value.value) value.value = val;
        });
        watch(value, (val)=> emit('update:modelValue', val));

        const classes = computed(()=> formFieldClasses(meta));

        const groupClasses = computed(()=> [...formGroupClasses(meta), props.floating ? 'form-floating' : 'form-group']);


        onMounted(()=>{
            fp.value = flatpickr(element.value, {
                locale: Russian,
                dateFormat: props.dateFormat,
                monthSelectorType: 'static',
                minDate: props.minDate,
                maxDate: props.maxDate,
                allowInput: props.allowInput,
            });
        })

        const onChange = (event) => {
            emit('update:modelValue', event.target.value);
        }

        return {
            element,
            onChange,
            errorMessage,
            value,
            classes,
            groupClasses,
            ...useRequiredFormGroup(props.rules),
        }
    }
}
</script>

<style scoped>

</style>
