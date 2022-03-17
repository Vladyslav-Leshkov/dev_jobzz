<template>
    <div class="mb-60">
        <div class="title-profile">{{ __('Specialization category') }}</div>

        <div class="row gx-2">

            <select-multiple v-for="spec in specializations"
                             class="mw-310 me-10 mb-10 col"
                             :key="'spec'+spec.id"
                             name="specializations[]"
                             :title="spec.title"
                             v-model="innerValue"
                             :options="spec.items"
            ></select-multiple>
        </div>
        <div class="form-text text-danger" v-if="errorMessage">{{ __('Choose your specialization') }}</div>
    </div>
</template>

<script>

import SelectMultiple from "../form/SelectMultiple";
import {useWizardOptions} from "./useWizardOptions";
import {useField} from "vee-validate";
import {watch} from "vue";

export default {
    name: "SpecializationSelector",
    components: {SelectMultiple},
    props: {
        modelValue: {
            type: Array,
            default(){
                return []
            }
        }
    },
    emits: ['update:modelValue'],
    setup(props, {emit}){
        const {value: innerValue, errorMessage} = useField('specializations[]',  props.rules, {
            initialValue: props.modelValue,
        });
        watch(innerValue, (val)=> emit('update:modelValue', val));

        return {
            ...useWizardOptions('specializations'),
            innerValue,
            errorMessage,
        }
    }
}
</script>

<style scoped>

</style>
