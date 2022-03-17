<template>
    <form :action="action" method="POST" @submit.prevent="onSubmit">
        <slot/>
        <transition name="fade">
            <div v-if="!showForm" class="d-flex justify-content-end mt-45">
                <a class="btn rounded-pill btn-lg btn-primary" href="#" @click.prevent="showForm = true">
                    <span>{{ __('Respond') }}</span>
                    <svg-icon class="ms-60" icon="arrow-right" size="15"/>
                </a>
            </div>
        </transition>

        <transition name="fade">
            <div v-if="showForm" class="candidate-offer  mb-70">
                <div>
                    <div class="mw-760">
                        <div class="candidate-offer-control">
                            <textarea-form-group v-model="comment"
                                                 :form-text="__('You can send standard text or edit it.')"
                                                 :label="__('Transmittal letter')"
                                                 name="comment"
                                                 rows="12"
                                                 rules="required"
                                                 auto-height
                            >
                                <div class="candidate-offer-regards" v-html="regardsText"></div>
                            </textarea-form-group>
                        </div>

                    </div>


                    <div class="row align-items-center gx-1">
                        <div class="col-12 col-xl-4">
                            <div class="form-group w-100 me-10">
                                <file-uploader accept=".doc,.docx,.pdf"
                                               :label="__('Attach resume *')"
                                               name="resume_upload"
                                               :value="resumeName"
                                               rules="required" @change="resumeChange"></file-uploader>
                            </div>
                        </div>
                        <div class="col-12 col-xl-auto">
                            <div v-if="!resumeError" class="form-text pb-45 lh-1">
                                {{ __('To apply for a vacancy, you need to attach a resume') }}
                            </div>
                            <div v-if="resumeError" class="form-text pb-45 lh-1 text-danger">
                                {{ __('You need to add a resume') }}
                            </div>
                        </div>
                    </div>


                    <div class="d-flex justify-content-end mw-760">
                        <button :disabled="!comment || loader || submitted"
                                class="btn rounded-pill btn-lg btn-primary"
                                type="submit"
                        >
                            <span>{{ __('Send') }}</span>
                            <svg-icon class="ms-60" icon="arrow-right" size="15"/>
                        </button>
                    </div>
                </div>
                <!--                <div v-if="submitted">-->
                <!--                    <div class="text-center page-subtitle">{{ __('Response sent') }}</div>-->
                <!--                </div>-->
            </div>
        </transition>

    </form>
</template>

<script>
import TextareaFormGroup from "../form/TextareaFormGroup";
import SvgIcon from "../svg/SvgIcon";
import {computed, ref} from "vue";
import {axiosPost} from "../../services/api";
import FileUploader from "../form/FileUploader";
import {nl2br} from "../../../utils/string";

export default {
    name: "VacancyOffer",
    components: {
        FileUploader,
        SvgIcon,
        TextareaFormGroup
    },
    props: {
        action: String,
        alreadySent: Array,
        comment: String,
        resumeName: String,
        regards: String,
    },
    setup(props) {
        const comment = ref(props.comment);
        const showForm = ref(false);
        const loader = ref(false);
        const submitted = ref(false);
        const existingResume = ref(!!props.resumeName);
        const resume = ref(null);
        const resumeError = ref(false);
        const sent = ref(props.alreadySent || []);

        const regardsText = computed(() => nl2br(props.regards));

        const resumeChange = (data) => {
            existingResume.value = false;
            resume.value = data && data.file ? data.file : null;
        }

        const onSubmit = async (event) => {
            if (!resume.value && !existingResume.value) {
                event.preventDefault();
                resumeError.value = true;
                return;
            }
            loader.value = true;
            const formData = new FormData();
            if (resume.value) {
                formData.append("resume_upload", resume.value);
            } else {
                formData.append("resume_existing", '1');
            }

            formData.append("comment", comment.value + '\n\n' + props.regards);
            const response = await axiosPost(props.action, formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            });
            if (response) {
                if (response.result === 'success') {
                    toast.success(response.message);
                    sent.value.push(response.offer.vacancy_id)
                    submitted.value = true;
                }
                if (response.result === 'error') {
                    toast.error(response.message);
                }
            }

            loader.value = false
        }

        return {
            showForm,
            comment,
            loader,
            submitted,
            sent,
            resume,
            resumeError,
            regardsText,
            onSubmit,
            resumeChange,
        }
    }
}
</script>

<style scoped>

</style>
