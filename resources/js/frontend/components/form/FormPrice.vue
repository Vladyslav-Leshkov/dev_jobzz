<template>
    <div class="form-price">
        <div ref="range" class="form-price-range"></div>
        <div class="form-price-inputs">
            <div class="input-group">
                <span class="input-group-text input-br w-input">{{ __('candidate.from') }} ₽</span>
                <input :value="fromState" class="form-control no-appearance" type="text"
                       @keyup="debounce(() => { fromState = $event.target.value})">
            </div>
            <div class="input-group">
                <span class="input-group-text input-br w-input">{{ __('candidate.to') }} ₽</span>
                <input :value="toState" class="form-control no-appearance" type="text"
                       @keyup="debounce(() => { toState = $event.target.value})">
            </div>
        </div>
    </div>
</template>

<script>
import noUiSlider from 'nouislider';
import {computed, onMounted, ref} from "vue";
import {toAmount} from "../../../utils/number";

export default {
    name: "FormPrice",
    props: {
        fromValue: Number,
        toValue: Number,
        rangeFrom: {
            type: Number,
            default: 0,
        },
        rangeTo: {
            type: Number,
            default: 1000000,
        },
        step: {
            type: Number,
            default: 1000,
        }
    },
    emits: ['update:fromValue', 'update:toValue'],
    setup(props, {emit}) {
        const range = ref(null);
        let sliderApi = ref(null);

        function createDebounce() {
            let timeout = null;
            return function (fnc, delayMs) {
                clearTimeout(timeout);
                timeout = setTimeout(() => {
                    fnc();
                }, delayMs || 400);
            };
        }

        const debounce = createDebounce();

        const fromState = computed({
            get() {
                return toAmount(props.fromValue, 0, true);
            },
            set(value) {
                let newValue = value ? parseInt(value.toString().replace(/\D/g, "")) : false;
                if (!newValue) newValue = 0;
                if (newValue !== props.fromValue) {
                    emit(`update:fromValue`, newValue);
                    sliderApi.value.set([newValue, toState.value]);
                }
            },
        });

        const toState = computed({
            get() {
                return toAmount(props.toValue, 0, true);
            },
            set(value) {
                let newValue = value ? parseInt(value.toString().replace(/\D/g, "")) : false;
                if (!newValue) newValue = 0;
                if (newValue !== props.toValue) {
                    emit(`update:toValue`, newValue);
                    sliderApi.value.set([fromState.value, newValue]);
                }
            },
        });


        onMounted(() => {
            sliderApi.value = noUiSlider.create(range.value, {
                range: {
                    min: props.rangeFrom,
                    max: props.rangeTo,
                },
                tooltips: {
                    from: value => {
                        console.log(value);
                        return value
                    },
                    to: value => {
                        const val = Math.round(value / 1000) * 1000;
                        return toAmount(val, 0, true);
                    },
                },
                step: props.step,
                start: [props.fromValue, props.toValue],
            });

            sliderApi.value.on('update', (values, handle, unencoded) => {
                debounce(function () {
                    fromState.value = Math.round(unencoded[0] / 1000) * 1000;
                    toState.value = Math.round(unencoded[1] / 1000) * 1000;
                }, 400)

            });
        });


        return {
            fromState,
            toState,
            range,
            debounce: debounce,
        }
    }
}
</script>

<style scoped>

</style>
