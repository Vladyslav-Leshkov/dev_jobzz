<template>
    <div class="form-check form-radio">
        <input type="radio"
               :name="name"
               :id="id || name +'-'+value"
               :value="value"
               class="form-check-input"
               @change="onChange"
               :checked="value === modelValue"
        >
        <label class="form-check-label" :for="id || name +'-'+value">
            <span><slot /></span>
        </label>
    </div>
</template>

<script>
import {useField} from "vee-validate";

export default {
    name: "FormRadio",
    props: {
        // The group's value
        modelValue: {
            type: null,
        },
        // Field's own value
        value: {
            type: null,
        },
        name: {
            type: String,
        },
        id: {
            type: String,
        },
        rules: {
            types: [String, Object],
            default: undefined,
        },
    },
    emits: ['update:modelValue'],
    setup(props, {emit}){
        const { checked, handleChange } = useField(props.name, props.rules);

        const onChange = ()=>{
            handleChange(props.value);
            emit('update:modelValue',  props.value);
        }
        return {
            onChange,
            checked,
        }
    }
}
</script>

<style scoped>

</style>
