<template>
    <div class="form-group" :class="groupClasses">
        <label :for="name" class="form-label" :class="{required: required}">{{label}}</label>
        <div class="form-control-group">
             <textarea class="form-control"
                       ref="inputRef"
                       :id="name"
                       :name="name"
                       v-model="value"
                       :placeholder="placeholder"
                       :required="required"
                       :class="classes"
                       :rows="rows"
             ></textarea>
            <slot/>
            <div class="form-note" v-if="notes">{{ notes }}</div>
            <div class="form-error" v-if="errorMessage">{{ errorMessage }}</div>
            <div class="form-text" v-if="formText && !errorMessage">{{ formText }}</div>
        </div>
    </div>
</template>

<script>
import { formGroupClasses, useRequiredFormGroup, formFieldClasses} from './useFromGroup';
import {useField} from "vee-validate";
import {computed, onBeforeUnmount, onMounted, onUnmounted, ref, toRefs, watch} from "vue";


export default {
    name: "TextareaFormGroup",
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
        rules: {
            type: [String, Object],
            default: '',
        },
        rows: {
            type: [Number, String],
            default: 3
        },
        autoHeight: Boolean
    },
    emits: ['update:modelValue'],
    setup({name, rules, modelValue, autoHeight}, {emit}) {
        const inputRef = ref(null);
        const {errorMessage, value, meta} = useField(name, rules, {
            initialValue: modelValue,
            validateOnMount: false
        });

        watch(value, (val) => emit('update:modelValue', val));

        const classes = computed(() => formFieldClasses(meta));

        const groupClasses = computed(() => formGroupClasses(meta));

        const onInput = () => {
            const tx = inputRef.value;
            tx.style.height = "auto";
            tx.style.height = (tx.scrollHeight) + "px";
        }

        onMounted(() => {
            if (autoHeight) {
                const tx = inputRef.value;
                tx.setAttribute("style", "height:" + (tx.scrollHeight) + "px;overflow-y:hidden;resize:none");
                tx.addEventListener("input", onInput, false);
            }
        });

        onBeforeUnmount(() => {
            if (autoHeight) {
                const tx = inputRef.value;
                tx.removeEventListener("input", onInput);
            }
        })

        return {
            inputRef,
            errorMessage,
            value,
            classes,
            groupClasses,
            ...useRequiredFormGroup(rules),
        };
    },
}
</script>

<style scoped>

</style>
