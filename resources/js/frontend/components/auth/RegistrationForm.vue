<template>
    <form :action="action" class="auth-form" method="post">
        <slot/>
        <input type="hidden" name="role" :value="role">
        <text-form-group v-model="formData.email" class="form-group-bb" label="Email" name="email"
                         @keydown="noSpaces($event)"
                         @change="trimValue($event)"
                         placeholder="email@email.com" type="email"/>

        <text-form-group v-model="formData.password" class="form-group-bb" :label="__('Password')" name="password"
                         :placeholder="__('Password')" type="password"/>

        <text-form-group v-model="formData.password_confirmation" class="form-group-bb" :label="__('Confirm Password')"
                         name="password_confirmation"
                         :placeholder="__('Confirm Password')"
                         type="password"/>

        <checkbox v-model="formData.agree" class="text-start" name="agree">
            {{ __('I accept') }}
            <a class="fw-bold" href="/policy" target="_blank">{{ __('Privacy policy') }}</a>
            {{ __('and') }}
            <a class="fw-bold" href="/terms" target="_blank">{{ __('Terms of Use') }}</a>
        </checkbox>
        <div class="form-text text-start mb-3 font-12">
            {{ __('By accepting the privacy policy, you give permission to process and store your personal data.') }}
        </div>

        <button :disabled="!valid || !formData.agree"
                class="btn btn-lg btn-block btn-primary w-80 rounded-pill mx-auto"
                type="submit"
        >
            {{ __('Sign up') }}
        </button>


    </form>
</template>

<script>
import TextFormGroup from "../form/TextFormGroup";
import {computed, reactive} from "vue";
import {useForm} from "vee-validate";
import Checkbox from "../form/Checkbox";

export default {
    name: "RegistrationForm",
    components: {
        Checkbox,
        TextFormGroup,
    },
    props: {
        action: String,
        resetUrl: String,
        role: String,
        errors: [Object, null],
    },
    setup({errors, role}) {

        const formData = reactive({
            email: '',
            password: '',
            password_confirmation: '',
            agree: false,
        });


        const {submitForm, meta, setFieldError} = useForm({
            validationSchema: {
                email: role === 'recruiter' ? 'required|email|corp_mail' : 'required|email',
                password: 'required|min:8',
                password_confirmation: 'required|min:8|confirmed:@password',
                agree: 'required',
            }
        });

        for (let k in errors) {
            setFieldError(k, errors[k][0]);
        }

        const valid = computed(() => meta.value.valid);

        const noSpaces = (evt) => {
            evt = (evt) ? evt : window.event;
            const charCode = (evt.which) ? evt.which : evt.keyCode;
            console.log(charCode);
            if (charCode === 13 || charCode === 32) {
                evt.preventDefault();
            } else {
                return true;
            }

        }
        const trimValue = (evt) => {
            if (evt.target.value && / */.test(evt.target.value)) {
                evt.target.value = evt.target.value.trim();
            }
        }

        return {
            valid,
            formData,
            noSpaces,
            trimValue,
        }
    }
}
</script>

<style scoped>

</style>
