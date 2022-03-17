<template>
    <div class="mb-60 personal-info" id="first_name_section">
        <div class="title-profile mb-20" id="last_name_section">{{ __('Personal Information') }}</div>
        <div class=" mw-840">
            <div class="row mb-10">
                <div class="col-12 pt-15">
                    <text-form-group class="mb-0"
                                     v-model.trim="linkedIn"
                                     label=""
                                     name="linked_in"
                                     :placeholder="__('Link to LinkedIn *')"
                    />
                </div>
                <div class="col-12 col-xl-6">
                    <text-form-group class="mb-0"
                                     v-model.trim="firstName"
                                     label=""
                                     name="first_name"
                                     :placeholder="__('Enter your name *')"
                    />

                    <text-form-group class="mb-0"
                                     v-model.trim="lastName"
                                     label=""
                                     name="last_name"
                                     :placeholder="__('Enter your surname *')"
                    />

                    <file-uploader name="resume_upload"
                                   @change="onResumeChange"
                                   :value="resume"
                                   :label="__('Attach resume')"
                                   accept=".doc,.docx,.txt,.rtf,.pdf,.odt"
                    ></file-uploader>
                </div>
                <div class="col-12 col-xl-6 pt-10" style="margin-top: -10px;">
                    <avatar-uploader name="avatar_upload" @change="onAvatarChange" :value="avatar"
                                     :title="__('Your avatar')"
                                     :label="__('Attach file')"
                    ></avatar-uploader>
                </div>
            </div>
            <div class="font-15">
                {{
                    __('The recruiter will be able to see your resume, photo and contact details only after you open them')
                }}
            </div>
        </div>

    </div>
</template>

<script>
import TextFormGroup from "../form/TextFormGroup";
import {useVModel} from "../../../composables/useVModel";
import FileUploader from "../form/FileUploader";
import AvatarUploader from "../form/AvatarUploader";

export default {
    name: "PersonalInfo",
    components: {AvatarUploader, FileUploader, TextFormGroup},
    props: {
        firstName: String,
        lastName: String,
        linkedIn: String,
        avatar: String,
        resume: String,
    },
    emits: ['update:firstName', 'update:lastName', 'update:linkedIn', 'change:resume', 'change:avatar'],
    setup(props, {emit}) {


        const onAvatarChange = (data) => {
            emit('change:avatar', data)
        }

        const onResumeChange = ({file, name}) => {
            emit('change:resume', {file: file, resume: name})
        }
        return {
            onAvatarChange,
            onResumeChange,
            firstName: useVModel(props, 'firstName'),
            lastName: useVModel(props, 'lastName'),
            linkedIn: useVModel(props, 'linkedIn'),
        }
    }
}
</script>

<style scoped lang="scss">
.personal-info {
    .form-error {
        position: absolute;
        margin-top: 0;
    }
}
</style>
