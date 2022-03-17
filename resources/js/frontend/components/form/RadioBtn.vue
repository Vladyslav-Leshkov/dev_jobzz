<template>
    <div class="custom-check">
        <input type="hidden" v-if="checked"
               :name="inputName"
               :value="value">
        <span class="rounded-pill bg-secondary check-label"
              @click="handleChange()"
              :class="{active: checked}"><slot /></span>
    </div>
</template>

<script>
import {computed, toRefs,} from "vue";

export default {
    name: "RadioBtn",
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
        rules: {
            types: [String, Object],
            default: undefined,
        },
        // Field's own value
        uncheckedValue: {
            type: null,
            default: false
        },
    },
    emits: ['update:modelValue'],
    setup(props, {emit}) {
        const {modelValue, value} = toRefs(props);


        const checked = computed(()=>{
            return Array.isArray(modelValue.value) ? modelValue.value.indexOf(value.value) !== -1 : modelValue.value === value.value;
        });

        const inputName = computed(()=>{
            return  Array.isArray(modelValue.value) ? props.name+'[]' : props.name;;
        });

        const handleChange = () => {
            let newVal = modelValue.value;
            if(!checked.value){
                newVal = Array.isArray(newVal) ? [props.value] : props.value;
            }else{
                newVal = Array.isArray(newVal) ? [] : props.uncheckedValue;
            }
            emit('update:modelValue', newVal);
        }


        return {
            checked, // readonly
            inputName, // readonly
            handleChange,
        };
    },
}
</script>

<style scoped>

</style>
