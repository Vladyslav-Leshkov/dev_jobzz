<template>
    <div>
        <div class="container-fluid container-lg pt-50 mb-50 mb-lg-100">
            <form :action="action" enctype="multipart/form-data" method="post" @submit="onSubmit"
                  class="recruiter-form">
                <slot/>
                <div class="row">
                    <div class="col-12 col-xl-7">
                        <text-form-group v-model="first_name" class="form-horizontal" :label="__('First Name')"
                                         name="first_name"
                                         rules="required"/>
                        <text-form-group v-model="last_name" class="form-horizontal" :label="__('Last Name')"
                                         name="last_name"
                                         rules="required"/>
                        <text-form-group v-model="position" class="form-horizontal"
                                         :label="__('Position in the company')"
                                         name="position" rules="required"/>
                        <text-form-group v-model="title" class="form-horizontal" :label="__('Company Name')"
                                         name="title"
                                         rules="required"/>
                        <text-form-group v-model="linked_in" class="form-horizontal" label="LinkedIn" name="linked_in"/>
                        <text-form-group v-model="telegram" class="form-horizontal" label="Telegram" name="telegram"/>
                        <text-form-group v-model="website" class="form-horizontal" :label="__('Website')"
                                         name="website"/>
                        <textarea-form-group v-model="address" class="form-horizontal" :label="__('Office address')"
                                             name="address"/>
                    </div>
                    <div class="col-12 order-xl-last">
                        <textarea-form-group v-model="description" :rows="10" class="form-horizontal"
                                             :label="__('Company description')" name="description"/>
                        <div class="form-group form-horizontal">
                            <div class="form-label">&nbsp;</div>
                            <checkbox v-model="is_product" name="is_product"><b>{{ __('Product company') }}</b>
                            </checkbox>
                        </div>
                    </div>
                    <div class="col-12 col-xl-5 col-xxl-4 offset-xxl-1 pt-20">
                        <avatar-uploader :label="__('Attach file')"
                                         :title="__('Company logo')"
                                         :value="logo"
                                         :crop="false"
                                         class="mb-15 compact logo"
                                         is-logo name="logo_upload"
                                         rules="required"
                                         @change="onLogoChange"/>

                        <avatar-uploader :label="__('Attach file')"
                                         :title="__('Your avatar')"
                                         :value="avatar"
                                         class="mb-15 compact"
                                         name="avatar_upload"
                                         rules="required"
                                         @change="onAvatarChange"/>
                    </div>

                </div>

                <div class="d-flex justify-content-end wizard-btns-row">
                    <button class="btn btn-lg btn-primary rounded-pill ms-15 btn-publish" name="publish" type="submit"
                            value="1">
                        <span>{{ __('Save') }}</span>
                        <svg-icon class="ms-60" icon="arrow-right" size="15"/>
                    </button>
                </div>
            </form>
        </div>

    </div>
</template>

<script>
import TextFormGroup from "../form/TextFormGroup";
import TextareaFormGroup from "../form/TextareaFormGroup";
import AvatarUploader from "../form/AvatarUploader";
import {provide} from "vue";
import {useWizardRecruiter} from "../wizard/useWizardOptions";
import Checkbox from "../form/Checkbox";
import {useForm} from "vee-validate";
import {useStore} from "vuex";
import {scrollToError} from "../wizard/useWizardErrors";

export default {
    name: "RecruiterWizard",
    components: {Checkbox, AvatarUploader, TextareaFormGroup, TextFormGroup},
    props: {
        action: {
            type: String,
        },
    },
    setup() {
        const {submitForm, validate, errors} = useForm({
            validationSchema: {
                title: 'required',
                position: 'required',
                first_name: 'required',
                last_name: 'required',
                linked_in: 'linkedin',
                website: 'url',
            },
        });

        const namespace = 'recruiterWizard';
        provide("STORE_NAMESPACE", namespace);

        const store = useStore();


        store.commit(namespace + '/UPDATE_FORM_DATA', {
            avatar: '',
            logo: '',
            first_name: '',
            last_name: '',
            position: '',
            linked_in: '',
            website: '',
            telegram: '',
            title: '',
            address: '',
            description: '',
            is_product: 0,
        });


        const onSubmit = async (event) => {
            const {valid} = await validate();
            if (valid) {
                await submitForm();
            } else {
                event.preventDefault();
                scrollToError(errors.value, '', '', -20);
            }
        }

        return {
            onSubmit,
            ...useWizardRecruiter(namespace)
        }
    }
}
</script>

<style scoped>

</style>
