<template>
    <form method="post" :action="action" class="auth-form">
        <slot/>
        <text-form-group label="Email" name="email" class="form-group-bb" v-model="formData.email"
                         placeholder="email@email.com" type="email" rules="required|email"/>

        <text-form-group :label="__('Password')" name="password" class="form-group-bb" v-model="formData.password"
                         :placeholder="__('Password')" type="password" rules="required"/>

        <input type="hidden" name="remember" value="1">

        <a :href="resetUrl" class="pass">{{ __('Forgot password?') }}</a>

        <button type="submit" :disabled="!valid" class="btn btn-lg btn-block btn-primary w-80 rounded-pill mx-auto">
            {{ __('Sign in') }}
        </button>


    </form>
</template>

<script>
import TextFormGroup from "../form/TextFormGroup";
import {computed, reactive} from 'vue';
import {useForm, useIsFormValid} from 'vee-validate';

export default {
    name: "AuthForm",
    components: {
        TextFormGroup,
    },
    props: {
        action: String,
        resetUrl: String,
        errors: [Object, null],
    },
    setup({errors}) {

        const formData = reactive({
            email: '',
            password: '',
        });


        const {submitForm, meta, setFieldError} = useForm();

        for (let k in errors) {
            setFieldError(k, errors[k][0]);
        }

        const valid = computed(() => meta.value.valid);

        return {
            valid,
            formData,
        }
    }
}
</script>

<style scoped>

</style>
