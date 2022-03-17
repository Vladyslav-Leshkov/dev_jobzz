<template>
    <div>
        <text-form-group
            v-model="innerValue.name"
            :label="__('Payer')"
            class="form-horizontal"
            name="name"
            rules="required"
        />
        <text-form-group
            v-model="innerValue.street_address1"
            :label="__('Payer\'s address')"
            class="form-horizontal"
            name="street_address1"
            rules="required"
        />
        <select-form-group
            v-model="innerValue.country_id"
            :label="__('Country')"
            :options="countries"
            class="form-horizontal"
            name="country_id"
            rules="required"
        ></select-form-group>
        <text-form-group
            v-model="innerValue.eu_vat_id"
            :form-text="__('For payments from the EU')"
            class="form-horizontal"
            label="EU VAT ID"
            name="eu_vat_id"
        />
    </div>
</template>

<script>
import TextFormGroup from "../form/TextFormGroup";
import {reactive, watch} from "vue";
import SelectFormGroup from "../form/SelectFormGroup";
import {useI18nLocal} from "../../store/composables/useI18nLocal";

export default {
    name: "InvoiceSwiftForm",
    components: {SelectFormGroup, TextFormGroup},
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
