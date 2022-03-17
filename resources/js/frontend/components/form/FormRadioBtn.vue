<template>
    <div class="custom-check">
        <input type="hidden" v-if="checked"
               :name="name"
               :value="value">
        <span class="rounded-pill bg-secondary check-label"
              @click="handleChange()"
              :class="{active: checked}"><slot /></span>
    </div>
</template>

<script>
import {computed, toRefs} from "vue";

export default {
    name: "FormRadioBtn",
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
            default: null
        },
    },
    emits: ['update:modelValue'],
    setup(props, {emit}){
        const {modelValue, value, uncheckedValue} = toRefs(props);


        const checked = computed(()=>{
            return modelValue.value === value.value;
        });

        const handleChange = () => {
            if(modelValue.value === value.value){
                emit('update:modelValue',  uncheckedValue.value);
            }else {
                emit('update:modelValue',  value.value);
            }
        }

        return {
            checked, // readonly
            handleChange,
        };
    }

}
</script>

<style scoped>

</style>
