<template>
    <div class="form-check">
        <input v-if="uncheckedValue !== null" :name="inputName" :value="uncheckedValue" type="hidden">
        <input :id="id || name" :checked="checked" :name="inputName" :value="checkedValue" class="form-check-input"
               type="checkbox" @change="onChange">
        <label :for="id || name" class="form-check-label">
            <span><slot/></span>
        </label>
    </div>
</template>

<script>
import {useField} from "vee-validate";
import {computed, watch} from "vue";

export default {
    name: "Checkbox",
    props: {
        name: {
            type: String,
            required: true,
        },
        id: {
            type: String,
        },
        modelValue: {
            type: [Boolean, Number, Array]
        },
        checkedValue: {
            type: null,
            default: 1
        },
        uncheckedValue: {
            type: null,
            default: 0
        },
        rules: {
            type: [String, Object],
        },

    },
    emits: ['update:modelValue', 'change'],
    setup(props, {emit}) {
        const {checked, handleChange} = useField(props.name, props.rules, {
            // 👇 These are important
            type: 'checkbox',
            initialValue: props.modelValue,
            checkedValue: props.checkedValue,
            uncheckedValue: props.uncheckedValue,
        });

        watch(checked, (val) => {
            emit('update:modelValue', val ? props.checkedValue : props.uncheckedValue);
        })

        const onChange = (event) => {
            handleChange(event);
            emit('change', event);
        }

        const inputName = computed(() => {
            return Array.isArray(props.modelValue) ? props.name + '[]' : props.name;
        });

        return {
            inputName,
            checked,
            onChange
        }
    }
}
</script>

<style scoped>

</style>
