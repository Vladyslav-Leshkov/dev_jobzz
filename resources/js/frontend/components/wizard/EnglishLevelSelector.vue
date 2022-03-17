<template>

    <div class="profile-page__english english-profile" id="english_level_section">
        <div class="english-profile__title title-profile">{{ __('English Level') }}</div>
        <div class="form-group">
            <form-select name="english_level" class="mw-630" :title="__('Select your level of English proficiency')"
                         v-model="innerValue" :options="options"/>
            <div class="form-text text-danger form-error" v-if="errorMessage">
                {{ __('Indicate level of English proficiency') }}
            </div>
            <div class="english-profile__sub mw-840 mt-1" v-if="selectedOption">{{ selectedOption.description }}</div>
        </div>
    </div>
</template>

<script>
import {computed, inject, ref, watch} from "vue";
import FormSelect from "../form/FormSelect";
import {useVModel} from "../../../composables/useVModel";
import {useWizardOptions} from "./useWizardOptions";
import {useField} from "vee-validate";

export default {
    name: "EnglishLevelSelector",
    components: {FormSelect},
    props: {
        modelValue: {
            type: Number,
            default: 0
        },
        rules: {
            type: [String, Object],
            default: ''
        },
    },
    emits: ['update:modelValue'],
    setup(props, {emit}){

        const { english_levels } =useWizardOptions('english_levels');

        const {value: innerValue, errorMessage} = useField('english_level',  props.rules, {
            initialValue: props.modelValue,
        });
        watch(innerValue, (val)=> emit('update:modelValue', val));

        const selectedOption = computed(()=> english_levels.find( o => o.id === innerValue.value));


        return {
            innerValue,
            errorMessage,
            options: english_levels,
            selectedOption,
        }
    }
}
</script>

<style scoped>

</style>
