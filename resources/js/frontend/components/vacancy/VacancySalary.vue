<template>
    <div id="salary_section" class="mb-60">
        <div class="title-profile">{{ __('The salary') }}</div>
        <div class="subtitle-profile">
            ({{
                __('candidates will not see the exact number, but the vacancy will be located in one of the salary categories')
            }})
        </div>
        <div class="d-flex align-items-center flex-wrap">
            <div class="income-profile__block">
                <div class="input-group income-input w-300p">
                    <span class="input-group-text input-p-l-auto">{{ __('vacancy.from') }}</span>

                    <input :value="priceFromState"
                           autocomplete="off"
                           class="form-control"
                           type="text"
                           @keyup="setValue($event, 'price-from')">
                    <span class="input-group-text w-96">{{ __('vacancy.rubles') }}</span>
                </div>
                <input :value="priceFrom" name="price_from" type="hidden">
            </div>
            <div class="income-profile__block">
                <div class="input-group income-input w-300p">
                    <span class="input-group-text input-p-l-auto">{{ __('vacancy.to') }}</span>
                    <input :value="priceToState"
                           autocomplete="off"
                           class="form-control"
                           type="text"
                           @keyup="setValue($event, 'price-to')">
                    <span class="input-group-text w-96">{{ __('vacancy.rubles') }}</span>
                </div>
                <input :value="priceTo" name="price_to" type="hidden">
            </div>

            <span>{{ __('Net (s\\n clean)') }}</span>
        </div>
    </div>
</template>

<script>
import {computed} from "vue";
import {toAmount} from "../../../utils/number";

export default {
    name: "VacancySalary",
    props: {
        priceFrom: Number,
        priceTo: Number,
    },
    emits: ['update:priceFrom', 'update:priceTo'],
    setup(props, {emit}) {
        const priceFromState = computed({
            get() {
                return toAmount(props.priceFrom, 0, true);
            },
            set(value) {
                let newValue = value ? parseInt(value.toString().replace(/\D/g, "")) : false;
                if (!newValue) newValue = 0;
                if (newValue !== props.priceFrom) {
                    emit(`update:priceFrom`, newValue);
                }

            },
        });

        const priceToState = computed({
            get() {
                return toAmount(props.priceTo, 0, true);
            },
            set(value) {
                let newValue = value ? parseInt(value.toString().replace(/\D/g, "")) : false;
                if (!newValue) newValue = 0;
                if (newValue !== props.priceTo) {
                    emit(`update:priceTo`, newValue);
                }

            },
        });

        const setValue = (event, field) => {
            const input = event.target;
            let value = 0;
            if (input.value) {
                value = parseInt(input.value.replace(/\D/g, ""));
            }

            if (!value || value < 0) {
                input.value = '0';
                value = 0;
            }
            if (toAmount(input.value) !== toAmount(value)) {
                input.value = toAmount(value);
            }
            if (field === 'price-from') {
                priceFromState.value = value;

            }
            if (field === 'price-to') {
                priceToState.value = value;
            }
        }

        return {
            priceFromState,
            priceToState,
            setValue,
        }
    }
}
</script>

<style scoped>

</style>