<template>

    <div id="experience_section" class="profile-page__experience experience-profile range-profile">
        <div class="experience-profile__title title-profile">{{ __('Work experience') }}</div>
        <input :value="modelValue" name="experience" type="hidden">
        <div :class="{'exp-min': modelValue === 0, 'exp-max': modelValue === max}"
             class="item-filter__range range-w635">
            <div ref="slider"
                 class="tooltip-bottom exp-range exp-line">
                <div class="range-profile__dots layer1">
                    <span v-for="option in max+1" class="dot"></span>
                </div>
            </div>
        </div>
        <div class="range-profile__text">
            <span v-show="modelValue > 1">{{ minTitle }}</span>
            <span v-show="modelValue < max - 1">{{ maxTitle }}</span>
        </div>
    </div>

</template>

<script>
import {computed, onMounted, ref} from 'vue';
import noUiSlider from 'nouislider';
import {pluralizeValue} from '../../../utils/string';
import {useVModel} from "../../../composables/useVModel";
import {trans} from "../../i18n/lang";

export default {
    name: "ExperienceSelector",
    props: {
        modelValue: {
            type: Number,
            default: 0
        },
        min: {
            type: Number,
            default: 0
        },
        max: {
            type: Number,
            default: 9
        },
        step: {
            type: Number,
            default: 1
        },
        minTitle: {
            type: String,
            default: trans('Without experience')
        },
        maxTitle: {
            type: String,
            default: trans('More than 10 years')
        },
        prefix: {
            type: String,
            default: ''
        },
        plural: {
            type: Array,
            default() {
                return [trans('year'), trans('года'), trans('years')]
            }
        },
    },
    emits: ['update:modelValue'],
    setup(props, {emit}) {

        // const { experiences } = useWizardOptions('experiences');

        const slider = ref(null);

        let sliderApi = null;

        onMounted(() => {
            sliderApi = noUiSlider.create(slider.value, {
                start: props.modelValue,
                tooltips: {
                    from: value => {
                        return value
                    },
                    to: value => {
                        const val = Math.round(value);
                        if (props.modelValue !== val) {
                            emit(`update:modelValue`, val);
                        }

                        if (val === 0) return props.minTitle;
                        if (val === 8) {
                            return trans('7-10 years');
                        }
                        if (val === props.max) return props.maxTitle;
                        if (val === 1) {
                            return trans('Less than a year');
                        }
                        return (props.prefix + ' ' + pluralizeValue(val - 1, ...props.plural)).trim()
                    },
                },
                step: props.step,
                range: {
                    'min': props.min,
                    'max': props.max
                },
            });

        })

        return {
            slider,
        }
    }
}
</script>

<style scoped>

</style>
