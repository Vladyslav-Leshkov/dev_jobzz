<template>
    <div>
        <div class="page-header mb-lg-25">
            <div class="container-fluid container-lg">
                <div class="page-header-body">
                    <h1 class="page-header-title"><span>{{ __('My Profile') }}</span></h1>
                </div>
            </div>
        </div>
        <div class="container-fluid container-lg mb-50 mb-lg-100">
            <form :action="action" enctype="multipart/form-data" method="post" @submit="onSubmit"
                  class="recruiter-form">
                <slot/>
                <div class="row">
                    <div class="col-12 col-xl-7">
                        <text-form-group v-model="first_name" :label="__('First Name')" class="form-horizontal"
                                         name="first_name" rules="required"/>
                        <text-form-group v-model="last_name" :label="__('Last Name')" class="form-horizontal"
                                         name="last_name"
                                         rules="required"/>
                        <text-form-group v-model="phone" :label="__('Mob. Phone')" class="form-horizontal" name="phone"
                                         rules="tel"/>
                        <text-form-group v-model="email" class="form-horizontal" label="Email" name="email"
                                         rules="required|email|corp_mail"/>
                        <text-form-group v-model="telegram" class="form-horizontal" label="Telegram" name="telegram"/>
                        <text-form-group v-model="linked_in"
                                         :form-text="__('Example:') + ' https://www.linkedin.com/in/username/'"
                                         class="form-horizontal"
                                         label="LinkedIn"

                                         name="linked_in"
                        />

                        <text-form-group v-model="position" :label="__('Your position')" class="form-horizontal"
                                         name="position"
                                         rules="required"/>
                        <text-form-group v-model="title" :label="__('Company name')" class="form-horizontal"
                                         name="title"
                                         rules="required"/>
                        <text-form-group v-model="website" :label="__('Company website')" class="form-horizontal"
                                         name="website"/>
                        <textarea-form-group v-model="address" :label="__('Company address')" class="form-horizontal"
                                             name="address"/>
                    </div>
                    <div class="col-12 order-xl-last">

                        <textarea-form-group v-model="description" :label="__('Company description')" :rows="10"
                                             class="form-horizontal full-width" name="description"/>

                        <!--                        <div class="form-group form-horizontal">-->
                        <!--                            <div class="form-label">&nbsp;</div>-->
                        <!--                            <checkbox v-model="is_product" name="is_product"><b>{{ __('Product company') }}</b>-->
                        <!--                            </checkbox>-->
                        <!--                        </div>-->
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

                <div class="d-flex justify-content-end wizard-btns-row mt-25">
                    <button class="btn btn-lg btn-primary rounded-pill ms-15 btn-publish" type="submit">
                        <span>{{ __('Save') }}</span>
                        <svg-icon class="ms-60" icon="arrow-right" size="15"/>
                    </button>
                </div>
            </form>
        </div>

    </div>
</template>

<script>
import Checkbox from "../form/Checkbox";
import AvatarUploader from "../form/AvatarUploader";
import TextareaFormGroup from "../form/TextareaFormGroup";
import TextFormGroup from "../form/TextFormGroup";
import {useForm} from "vee-validate";
import {provide} from "vue";
import {useStore} from "vuex";
import {useWizardRecruiter} from "../wizard/useWizardOptions";
import {scrollToError} from "../wizard/useWizardErrors";

export default {
    name: "RecruiterAccount",
    components: {Checkbox, AvatarUploader, TextareaFormGroup, TextFormGroup},
    props: {
        action: {
            type: String,
        },
        user: Object,
        company: Object,
    },
    setup({user, company}) {
        const {submitForm, validate, errors} = useForm({
            validationSchema: {
                title: 'required',
                position: 'required',
                first_name: 'required',
                last_name: 'required',
                linked_in: 'linkedin',
                email: 'required|email|corp_mail',
                website: 'url',
                phone: 'tel',
            },
        });

        const namespace = 'recruiterWizard';
        provide("STORE_NAMESPACE", namespace);

        const store = useStore();
        store.commit(namespace + '/UPDATE_FORM_DATA', {
            title: company.title,
            description: company.description,
            address: company.address,
            position: company.position,
            logo: company.logo_url,
            website: company.website,
            avatar: user.avatar_url,
            linked_in: user.linked_in,
            first_name: user.first_name,
            last_name: user.last_name,
            phone: user.phone,
            telegram: user.telegram,
            email: user.email,
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
