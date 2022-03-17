<template>
    <div class="mb-60" :id="name+'_section'">
        <div class="title-profile">{{ __('Most suitable job options') }}</div>
        <div class="row mw-1200">
            <div class="col-12 col-xl-4">
                <div class="form-check" v-for="option in nonFreelanceOptions" :key="'emp-opt-'+option.id">
                    <input class="form-check-input" name="employment_types[]" v-model="innerValue"
                           @change="notFreelanceChange($event, option.id)" type="checkbox" :value="option.id"
                           :id="'office-'+option.id">
                    <label class="form-check-label" :for="'office-'+option.id">
                        {{ option.description ? `${option.title} (${option.description})` : option.title }}
                    </label>
                </div>
            </div>

            <div class="col-12 col-xl-8">
                <div class="form-check form-radio" v-for="option in freelanceOptions" :key="'emp-opt-'+option.id">
                    <input class="form-check-input" name="employment_types[]" v-model="innerValue"
                           @change="freelanceChange($event, option.id)" type="checkbox" :value="option.id"
                           :id="'office-'+option.id">
                    <label class="form-check-label" :for="'office-'+option.id">
                        {{ option.description ? `${option.title} (${option.description})` : option.title }}
                    </label>
                </div>
                <div class="options-profile__tetx">
                    {{
                        __('We have highlighted this category separately, since we want the candidate to be focused on long-term work in a full-time company or only freelance.')
                    }}
                </div>
            </div>
        </div>
        <div class="form-text text-danger" v-if="errorMessage">{{ __('Select job options') }}</div>
    </div>
</template>

<script>
import {computed, inject, ref, watch} from "vue";
import {useVModel} from "../../../composables/useVModel";
import {useWizardOptions} from "./useWizardOptions";
import {useField} from "vee-validate";

export default {
    name: "EmploymentSelector",
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
        name: {
            type: String,
            default: 'employment_types',
        }
    },
    emits: ['update:modelValue'],
    setup(props, {emit}) {

        const {value: innerValue, errorMessage} = useField(props.name, props.rules, {
            initialValue: props.modelValue,
        });
        watch(innerValue, (val) => {
            if (!_.isEqual(val, props.modelValue)) {
                emit('update:modelValue', val)
            }
        });

        const {employment_types: options} = useWizardOptions('employment_types');

        const nonFreelanceOptions = computed(() => options.filter(o => !o.freelance && !o.remotely))
        const freelanceOptions = computed(() => options.filter(o => o.freelance));
        const remotelyOptions = computed(() => options.filter(o => o.remotely));
        const freelanceIds = computed(() => freelanceOptions.value.map(o => o.id));
        const remotelyIds = computed(() => remotelyOptions.value.map(o => o.id));

        const freelanceChange = (evt, id) => {
            if (evt.target.checked) {
                innerValue.value = [...innerValue.value.filter(it => remotelyIds.value.indexOf(it) !== -1), id];
            }
        }

        const notFreelanceChange = (evt, id) => {
            if (evt.target.checked) {
                innerValue.value = innerValue.value.filter(it => freelanceIds.value.indexOf(it) === -1);
            }
        }

        watch(() => props.modelValue, (val) => {
            if (!_.isEqual(val, innerValue.value)) {
                innerValue.value = val;
            }
        })

        return {
            nonFreelanceOptions,
            freelanceOptions,
            innerValue,
            errorMessage,
            freelanceChange,
            notFreelanceChange,
        }
    }
}
</script>

<style scoped>

</style>
