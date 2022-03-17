<template>
    <div class="profile-page__income income-profile">
        <div class="income-profile__title title-profile">{{ __('Salary wishes') }}</div>
        <div class="income-profile__items">
            <div :class="{'d-none':isFreelanceSelected && employment_types.length}" class="income-profile__block">
                <div class="income-profile__text">Full Time *</div>
                <div class="input-group income-input w-300p">
                    <span class="input-group-text input-p-l-auto">от</span>
                    <input :disabled="isFreelanceSelected  && employment_types.length"
                           :required="!isFreelanceSelected"
                           :value="fullTimeState"
                           autocomplete="off"
                           class="form-control"
                           type="text"
                           @keyup="setValue($event, 'full_time')">
                    <span class="input-group-text w-96">{{ __('rubles') }}</span>
                </div>
                <input :value="fullTime" name="price_full_time" type="hidden">
            </div>
            <div :class="{'d-none':!isFreelanceSelected && employment_types.length}" class="income-profile__block">
                <div class="income-profile__text">{{ __('Freelance') }} *</div>
                <div class="input-group income-input w-300p">
                    <span class="input-group-text input-p-l-auto">от</span>
                    <input :disabled="!isFreelanceSelected  && employment_types.length"
                           :required="isFreelanceSelected"
                           :value="freelanceState"
                           autocomplete="off"
                           class="form-control"
                           type="text"
                           @keyup="setValue($event, 'freelance')">

                    <span class="input-group-text w-130">{{ __('rubles/hour') }}</span>
                </div>
                <input :value="freelance" name="price_freelance" type="hidden">
            </div>
        </div>
    </div>
</template>

<script>
import {useVModel} from "../../../composables/useVModel";
import {useIsFreelanceSelected} from "./useWizardOptions";
import {computed, inject} from "vue";
import {useFormDataProperty} from "../../store/composables/useFormData";
import {toAmount} from "../../../utils/number";

export default {
    name: "SalarySelector",
    props: {
        fullTime: Number,
        freelance: Number,
    },
    emits: ['update:fullTime', 'update:freelance',],
    setup(props, {emit}) {
        const namespace = inject('STORE_NAMESPACE');

        const fullTimeState = computed({
            get() {
                return toAmount(props.fullTime);
            },
            set(value) {
                let newValue = value ? parseInt(value.toString().replace(/\D/g, "")) : false;
                if (!newValue) newValue = 0;
                if (newValue !== props.fullTime) {
                    emit(`update:fullTime`, newValue);
                }

            },
        });

        const freelanceState = computed({
            get() {
                return toAmount(props.freelance);

            },
            set(value) {
                let newValue = value ? parseInt(value.toString().replace(/\D/g, "")) : false;
                if (!newValue) newValue = 0;
                if (newValue !== props.freelance) {
                    emit(`update:freelance`, newValue);
                }

            },
        });

        const setValue = (event, field) => {
            const input = event.target;
            let value = 0;
            if (input.value) {
                value = parseInt(input.value.replace(/\D/g, ""));
            }

            if (!value || value < 1) {
                input.value = '';
                value = 0;
            }
            if (toAmount(input.value) !== toAmount(value)) {
                input.value = toAmount(value);
            }
            if (field === 'freelance') {
                freelanceState.value = value;
            }
            if (field === 'full_time') {
                fullTimeState.value = value;
            }
        }


        return {
            fullTimeState,
            freelanceState,
            setValue,
            employment_types: useFormDataProperty('employment_types', namespace),
            ...useIsFreelanceSelected(namespace)
        }
    }
}
</script>

<style scoped>

</style>
