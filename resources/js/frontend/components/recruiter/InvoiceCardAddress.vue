<template>
    <div class="card p-40 bg-light invoice-card-address">
        <div class="page-title mb-30">{{ __('Payer\'s details') }}</div>
        <text-form-group
            v-model="innerValue.name"
            :label="__('Full name')"
            :placeholder="__('Your name and surname')"
            class="form-group-bb"
            name="name"
            rules="required"
        />

        <!--        <text-form-group-->
        <!--            v-model="innerValue.street_address1"-->
        <!--            :label="__('Address')"-->
        <!--            :placeholder="__('Your address')"-->
        <!--            class="form-group-bb"-->
        <!--            name="street_address1"-->
        <!--        />-->

        <!--        <text-form-group-->
        <!--            v-model="innerValue.postcode"-->
        <!--            :label="__('Zip')"-->
        <!--            :placeholder="__('Your zip code')"-->
        <!--            class="form-group-bb"-->
        <!--            name="postcode"-->
        <!--        />-->

        <text-form-group
            v-model="innerValue.phone"
            :label="__('Phone number')"
            class="form-group-bb"
            name="phone"
            placeholder="+7__________"
            rules="tel|required"

        />

        <text-form-group
            v-model="innerValue.email"
            class="form-group-bb"
            label="Email"
            name="email"
            placeholder="mail@example.com"
            rules="required|email"
        />
    </div>
</template>

<script>
import {reactive, watch} from "vue";
import TextFormGroup from "../form/TextFormGroup";
import {useI18nLocal} from "../../store/composables/useI18nLocal";

export default {
    name: "InvoiceCardAddress",
    components: {TextFormGroup},
    props: {
        modelValue: Object,
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
