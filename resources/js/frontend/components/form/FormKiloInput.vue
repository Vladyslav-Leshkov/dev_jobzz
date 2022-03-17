<template>
    <div>
        <input ref="input" :value="innerValue" type="text">
    </div>

</template>

<script>
import {computed, ref} from "vue";

export default {
    name: "FormKiloInput",
    props: {
        modelValue: {
            type: [Number],
        }
    },
    setup(props, {emit}) {
        const input = ref(null);

        return {
            input,
            innerValue,
        }
    }
}
</script>

<style scoped>

</style>
