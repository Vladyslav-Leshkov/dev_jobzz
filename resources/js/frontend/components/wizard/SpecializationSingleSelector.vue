<template>
    <div id="specializations_section" class="mb-60">
        <div class="title-profile">{{ __('Specialization category') }}</div>
        <div class="row gx-2">
            <input :value="innerValue" name="specializations" type="hidden">
            <form-select
                v-for="spec in specializations"

                :key="'spec'+spec.id"
                v-model="innerValue"
                :options="spec.items"
                :title="spec.title"
                class="mw-310 me-10 mb-10 col"
                name="spec"
            >

            </form-select>

        </div>
        <div v-if="errorMessage" class="form-text text-danger">{{ __('Choose your specialization') }}</div>
    </div>
</template>

<script>
import {useField} from "vee-validate";
import {watch} from "vue";
import {useWizardOptions} from "./useWizardOptions";
import SvgIcon from "../svg/SvgIcon";
import SelectMultiple from "../form/SelectMultiple";
import FormSelect from "../form/FormSelect";

export default {
    name: "SpecializationSingleSelector",
    components: {FormSelect, SelectMultiple, SvgIcon},
    props: {
        modelValue: {
            type: Array,
            default() {
                return []
            }
        },
        rules: {
            type: [String, Object],
            default: ''
        },
    },
    emits: ['update:modelValue'],
    setup(props, {emit}) {


        const {value: innerValue, errorMessage} = useField('specializations', props.rules, {
            initialValue: props.modelValue.length ? props.modelValue[0] : null,
        });

        //const innerValue = ref(props.modelValue.length ? props.modelValue[0] : 0);

        watch(innerValue, (val) => {
            emit('update:modelValue', [val]);
        });

        const {specializations} = useWizardOptions('specializations');

        return {
            specializations,
            innerValue,
            errorMessage,
        }
    }
}
</script>

<style scoped>

</style>
