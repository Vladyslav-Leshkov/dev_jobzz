<template>
    <form id="form-wizard" enctype="multipart/form-data" @submit="onSubmit">
        <div class="profile-page__line">
            <span>{{ __('step') }} {{ currentStep }}/{{ stepCounter }}</span>
        </div>

        <slot/>

        <div class="wizard-btns wizard-btns-row">
            <a v-if="hasPrevious" class="wizard-back" href="#" @click.prevent="goToPrev">
                <span class="btn btn-lg btn-outline-secondary btn-back"><svg-icon icon="arrow-left" size="15"/></span>
                <span class="ms-10">{{ __('Back') }}</span>
            </a>
            <button v-if="!isLastStep" class="btn btn-lg btn-primary rounded-pill btn-next"
                    type="submit"
            >
                <span>{{ __('Proceed') }}</span>
                <svg-icon class="ms-60" icon="arrow-right" size="15"/>
            </button>

            <div v-if="isLastStep" class="wizard-btns-right">
                <a class="btn btn-lg btn-link btn-preview" href="#" @click.prevent="showPreview()">
                    <svg-icon class="me-5" icon="eye" size="25"/>
                    <span>{{ __('Preview') }}</span></a>
                <button class="btn btn-lg btn-outline-primary btn-save" name="publish" type="submit" value="2">
                    <span>{{ __('Save without publishing') }}</span>
                </button>
                <button class="btn btn-lg btn-primary ms-15 btn-publish" name="publish" type="submit" value="1">
                    <span>{{ __('Publish') }}</span>
                    <svg-icon class="ms-60" icon="arrow-right" size="15"/>
                </button>
            </div>
        </div>

    </form>
</template>

<script>
import {useForm} from "vee-validate";
import {ref, computed, provide, inject} from "vue";
import SvgIcon from "../svg/SvgIcon";
import {useWizardCurrentStepIdx, useWizardPreview} from "../wizard/useWizardOptions";
import {useWizardErrors} from "../wizard/useWizardErrors";
import * as URLUtils from "../../../utils/url";
import {scrollTo} from "../../../utils/functions";
import {useStore} from "vuex";

export default {
    name: "FormWizard",
    components: {SvgIcon},
    emits: ["next", "submit"],
    props: {
        validationSchema: {
            type: Array,
            required: true,
        },
    },
    setup(props, {emit}) {
        const store = useStore();
        const namespace = inject('STORE_NAMESPACE');
        const formData = computed(() => store.state[namespace].formData);

        // Injects the starting step, child <form-steps> will use this to generate their ids
        const stepCounter = ref(0);
        provide("STEP_COUNTER", stepCounter);
        // Inject the live ref of the current index to child components
        // will be used to toggle each form-step visibility

        const {currentStepIdx} = useWizardCurrentStepIdx(namespace);
        const currentStep = computed(() => currentStepIdx.value + 1);
        provide("CURRENT_STEP_INDEX", currentStepIdx);

        // if this is the last step
        const isLastStep = computed(() => {
            return currentStepIdx.value === stepCounter.value - 1;
        });

        // If the `previous` button should appear
        const hasPrevious = computed(() => {
            return currentStepIdx.value > 0;
        });

        // extracts the individual step schema
        const currentSchema = computed(() => {
            return props.validationSchema[currentStepIdx.value];
        });

        // vee-validate will be aware of computed schema changes
        const {resetForm, submitForm, validate, errors} = useForm({
            validationSchema: currentSchema,
        });

        const {scrollToError} = useWizardErrors();

        // We are using the "submit" handler to progress to next steps
        // and to submit the form if its the last step
        // parent can opt to listen to either events if interested
        const onSubmit = async (event) => {
            const result = await validate();
            if (result.valid) {
                if (!isLastStep.value) {
                    event.preventDefault();
                    currentStepIdx.value++;
                    emit("next", formData.value);
                    scrollTo('.profile-page', -20);
                    return;
                }

                emit("submit", formData.value);
                await submitForm();
            } else {
                event.preventDefault();
                scrollToError(errors.value);

            }
        };

        function goToPrev() {
            if (currentStepIdx.value === 0) {
                return;
            }

            currentStepIdx.value--;
            scrollTo('.profile-page', -20);

        }

        const {preview} = useWizardPreview(namespace);

        const showPreview = () => {
            URLUtils.updateQuery('/profile/preview', {wizard: 1});
            preview.value = true;
            scrollTo('.header', 88);
        }

        return {
            currentStep,
            stepCounter,
            onSubmit,
            submitForm,
            hasPrevious,
            isLastStep,
            goToPrev,
            preview,
            showPreview,
        };
    },
}
</script>

<style scoped>

</style>
