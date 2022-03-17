<template>
    <div class="msgr-contacts-form">
        <a class="close" href="#" @click.prevent="close()">
            <svg-icon icon="chevron-down" size="24"/>
        </a>
        <div class="page-title mb-25">{{ __('Contact details') }}</div>
        <div class="row">
            <div class="col-12 col-md-6">
                <form-contact-group v-model:filedValue="filedValue.email" v-model:usedValue="usedValue.email"
                                    :required="true"
                                    readonly
                                    label="Email"
                                    name="email"
                                    rules="required"
                                    type="email"
                />
            </div>
            <div class="col-12 col-md-6">
                <form-contact-file v-model:filedValue="filedValue.resume" v-model:usedValue="usedValue.resume"
                                   :required="true"
                                   :label="__('Resume')"
                                   name="resume"
                                   rules="required"
                                   @change="onResumeChange"
                />
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-md-6">
                <form-contact-group v-model:filedValue="filedValue.skype" v-model:usedValue="usedValue.skype"
                                    label="Skype"
                                    name="skype"
                                    type="text"
                />
                <form-contact-group v-model:filedValue="filedValue.phone" v-model:usedValue="usedValue.phone"
                                    :label="__('Mob. Phone')"
                                    name="phone"
                                    type="text"
                />
                <form-contact-group v-model:filedValue="filedValue.telegram" v-model:usedValue="usedValue.telegram"
                                    label="Telegram"
                                    name="telegram"
                                    type="text"
                />
            </div>
            <div class="col-12 col-md-6">


                <form-contact-group v-model:filedValue="filedValue.linked_in" v-model:usedValue="usedValue.linked_in"
                                    label="LinkedIn"
                                    name="linked_in"
                                    type="text"
                />
                <form-contact-group v-model:filedValue="filedValue.github" v-model:usedValue="usedValue.github"
                                    label="Github"
                                    name="github"
                                    type="text"
                />
                <form-contact-group v-model:filedValue="filedValue.portfolio" v-model:usedValue="usedValue.portfolio"
                                    :label="__('Portfolio')"
                                    name="portfolio"
                                    type="text"
                />


            </div>
        </div>
    </div>
</template>

<script>
import SvgIcon from "../svg/SvgIcon";
import FormContactGroup from "../form/FormContactGroup";
import {computed, onMounted, reactive, ref, watch} from "vue";
import FormContactFile from "../form/FormContactFile";
import {useStore} from "vuex";

export default {
    name: "MessengerContactsForm",
    components: {FormContactFile, FormContactGroup, SvgIcon},

    emits: ['close', 'update:modelValue'],
    setup({modelValue}, {emit}) {
        const store = useStore();

        const contacts = computed(() => store.state.messenger.currentContacts);

        const filedValue = reactive(Object.assign({
            email: '',
            skype: '',
            phone: '',
            telegram: '',
            linked_in: '',
            github: '',
            portfolio: '',
            resume: '',
            resume_upload: '',
        }, contacts.value));

        const usedValue = reactive({
            email: true,
            skype: !!filedValue.skype,
            phone: !!filedValue.phone,
            telegram: !!filedValue.telegram,
            linked_in: !!filedValue.linked_in,
            github: !!filedValue.github,
            portfolio: !!filedValue.portfolio,
            resume: true,
        });

        const onResumeChange = (payload) => {
            if (payload) {
                store.commit('messenger/SET_FILE_UPLOAD', payload);
                filedValue.resume = payload.name;
            } else {
                store.commit('messenger/SET_FILE_UPLOAD', {file: null});
                filedValue.resume = '';
            }
        }
        watch(filedValue, () => update());
        watch(usedValue, () => update());

        const update = () => {
            const values = {};

            for (let key in usedValue) {
                if (usedValue[key] && filedValue[key]) {
                    values[key] = filedValue[key];
                }
            }
            store.commit('messenger/SET_FIELDS_CONTACTS', values);
        };

        const close = () => {
            emit('close');
        }

        onMounted(() => {
            store.commit('messenger/SET_FILE_UPLOAD', {file: null});
            update();
        })

        return {
            close,
            usedValue,
            filedValue,
            onResumeChange,
        }
    }
}
</script>

<style scoped>

</style>
