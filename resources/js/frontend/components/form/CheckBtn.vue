<template>
    <div class="custom-check">
        <input v-if="checked" :name="inputName"
               :value="value"
               type="hidden">
        <span :class="{active: checked}"
              class="rounded-pill bg-secondary check-label py-5"
              @click="handleChange()"><slot/></span>
    </div>
</template>

<script>
import {computed, toRefs,} from "vue";

export default {
    name: "CheckBtn",
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


        const checked = computed(() => {
            return Array.isArray(modelValue.value) ? modelValue.value.indexOf(value.value) !== -1 : modelValue.value === value.value;
        });

        const inputName = computed(() => {
            return Array.isArray(modelValue.value) ? props.name + '[]' : props.name;

        });

        const handleChange = () => {
            let newVal = modelValue.value;
            if (!checked.value) {
                newVal = Array.isArray(newVal) ? [...newVal, props.value] : props.value;
            } else {
                newVal = Array.isArray(newVal) ? newVal.filter(v => v !== props.value) : props.uncheckedValue;
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
