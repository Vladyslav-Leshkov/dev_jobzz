<template>
    <div>
        <text-form-group
            v-model="innerValue.vat_id"
            :label="__('Tax number')"
            floating
            name="vat_id"
            rules="required"
        />
        <text-form-group
            v-model="innerValue.name"
            :label="__('Payer')"
            floating
            name="name"
            rules="required"
        />
    </div>
</template>

<script>
import TextFormGroup from "../form/TextFormGroup";
import {reactive, watch} from "vue";
import {useI18nLocal} from "../../store/composables/useI18nLocal";

export default {
    name: "InvoicePayerForm",
    components: {TextFormGroup},
    props: {
        modelValue: Object,
        countries: Array,
    },
    emits: ['update:modelValue'],
    setup(props, {emit}) {
        const innerValue = reactive(props.modelValue);
        watch(innerValue, value => {
            emit('update:modelValue', value);
        });
        return {
            innerValue,
        }
    }
}
</script>

<style scoped>

</style>
