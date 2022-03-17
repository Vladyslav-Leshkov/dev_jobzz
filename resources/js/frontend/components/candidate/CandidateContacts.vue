<template>
    <form :action="action" enctype="multipart/form-data" method="post" @submit="onSubmit">
        <slot/>
        <div class="row mb-30">
            <div class="col-12 col-xl-7">
                <text-form-group v-model="formData.first_name" class="form-horizontal" :label="__('First Name')"
                                 name="first_name"
                                 rules="required"/>
                <text-form-group v-model="formData.last_name" class="form-horizontal" :label="__('Last Name')"
                                 name="last_name"
                                 rules="required"/>
                <text-form-group v-model="formData.email" class="form-horizontal" label="Email" name="email"
                                 rules="required"/>
                <text-form-group v-model="formData.skype" class="form-horizontal" label="Skype" name="skype"/>
                <text-form-group v-model="formData.phone" class="form-horizontal" :label="__('Mob. Phone')"
                                 name="phone"/>
                <text-form-group v-model="formData.telegram" class="form-horizontal" label="Telegram" name="telegram"/>
                <text-form-group v-model="formData.linked_in" class="form-horizontal"
                                 :form-text="__('For example:') + ' https://www.linkedin.com/in/profile-name/'"
                                 label="LinkedIn"
                                 name="linked_in"/>
                <text-form-group v-model="formData.github" class="form-horizontal" label="GitHub" name="github"/>
                <text-form-group v-model="formData.portfolio" class="form-horizontal" :label="__('Portfolio link')"
                                 name="portfolio"/>
                <form-upload-group v-if="profile"
                                   :file-name="profile.resume_name"
                                   :value="profile.resume"
                                   accept=".doc,.docx,.pdf"
                                   class="form-horizontal"
                                   :label="__('Resume')"
                                   name="resume"
                                   @change="onResumeChange"/>

                <switch-form-group
                    v-if="profile && profile.status !== 3 && profile.status !== 4  && profile.status !== 5"
                    v-model="profile.status"
                    :active-value="1"
                    :inactive-value="2"
                    :active-text="__('Recruiters see your profile and can send you new offers')"
                    class="form-horizontal"
                    :inactive-text="__('You will not receive job offers from recruiters, but you can apply for vacancies yourself')"
                    :label="__('Profile is active')"
                    @update:model-value="askModal($event)"
                    name="status"/>


                <switch-form-group v-if="profile && profile.status === 3"
                                   v-model="profile.status"
                                   :active-value="1"
                                   :inactive-value="3"
                                   :active-text="__('Recruiters see your profile and can send you new offers')"
                                   class="form-horizontal"
                                   disabled
                                   :inactive-text="__('Your profile has been blocked by the administrator')"
                                   :label="__('Profile is active')"
                                   name="status"/>

                <switch-form-group v-if="profile && profile.status === 4"
                                   v-model="profile.status"
                                   :active-value="1"
                                   :inactive-value="4"
                                   :active-text="__('Recruiters see your profile and can send you new offers')"
                                   class="form-horizontal"
                                   disabled
                                   :inactive-text="__('Your profile is on moderation')"
                                   :label="__('Profile is active')"
                                   name="status"/>
            </div>
            <div class="col-12 col-xl-5 col-xxl-4 offset-xxl-1 pt-20">
                <avatar-uploader :value="user.avatar_url" class="mb-15 compact" name="avatar_upload"
                                 rules="required" @change="onAvatarChange"/>
                <div class="form-text">
                    {{
                        __('The recruiter will be able to see your resume, photo and contact details only after you open them')
                    }}
                </div>
            </div>

        </div>

        <div class="d-flex justify-content-between flex-wrap wizard-btns-row">
            <button class="btn btn-lg btn-primary rounded-pill btn-publish mb-10" name="publish" type="submit"
                    value="1">
                <span>{{ __('Save') }}</span>
                <svg-icon class="ms-60" icon="arrow-right" size="15"/>
            </button>

            <a class="btn btn-lg btn-outline-danger px-40 me-35 rounded-pill mb-10" href="/profile/delete">
                <span>{{ __('Delete account') }}</span>
            </a>
        </div>

        <bs-modal :close-btn="false" :opened="modalOpened" @bs-hide="modalOpened = false">
            <div class="modal-body">
                <div class="font-18 text-center fw-600 mb-20">{{ __('Did our resource help you find a job?') }}</div>
                <a :href="`/recruiter/confirm`"
                   class="btn btn-primary d-block w-100 mb-20">{{ __('Yes, I found a job at') }} Jobzz.ru</a>
                <button class="btn btn-outline-secondary w-100 d-block"
                        @click.prevent="answerNo()">{{ __('No, didn\'t help') }}
                </button>
            </div>
        </bs-modal>
    </form>

</template>

<script>
import Checkbox from "../form/Checkbox";
import AvatarUploader from "../form/AvatarUploader";
import TextareaFormGroup from "../form/TextareaFormGroup";
import TextFormGroup from "../form/TextFormGroup";
import {useForm} from "vee-validate";
import {reactive, ref} from "vue";
import FormUploadGroup from "../form/FormUploadGroup";
import SvgIcon from "../svg/SvgIcon";
import SwitchFormGroup from "../form/SwitchFormGroup";
import {scrollToError} from "../wizard/useWizardErrors";
import BsModal from "../bootstrap/BsModal";

export default {
    name: "CandidateContacts",
    components: {
        BsModal,
        SwitchFormGroup, SvgIcon, FormUploadGroup, Checkbox, AvatarUploader, TextareaFormGroup, TextFormGroup
    },
    props: {
        user: {
            type: Object
        },
        profile: {
            type: Object,
            default() {
                return {
                    status: 5,
                    resume: '',
                    resume_name: '',
                }
            }
        },
        action: {
            type: String,
        },
    },
    setup({user, profile}) {
        const {submitForm, validate, errors} = useForm({
            validationSchema: {
                first_name: 'required',
                last_name: 'required',
                email: 'required|email',
                phone: 'tel',
                linked_in: 'linkedin',
                portfolio: 'url',
            },
        });

        const formData = reactive({
            first_name: user.first_name,
            last_name: user.last_name,
            email: user.email,
            skype: user.skype,
            phone: user.phone,
            telegram: user.telegram,
            linked_in: user.linked_in,
            github: user.github,
            portfolio: user.portfolio,
            avatar_upload: null,
            resume_upload: null,
        });

        const onAvatarChange = (data) => {
            formData.avatar_upload = data.file;
        }

        const onResumeChange = (data) => {
            formData.resume_upload = data.file;
        }

        const onSubmit = async (event) => {
            const {valid} = await validate();
            if (valid) {
                await submitForm();
            } else {
                event.preventDefault();
                scrollToError(errors.value, '', '', -20);
            }
        }

        const modalOpened = ref(false);


        const askModal = async (status) => {
            if (status === 2) {
                modalOpened.value = true;
            }
        }

        const answerNo = async () => {
            modalOpened.value = false;
        }

        return {
            onResumeChange,
            onAvatarChange,
            onSubmit,
            formData,
            modalOpened,
            askModal,
            answerNo,
        }
    }
}
</script>

<style scoped>

</style>
