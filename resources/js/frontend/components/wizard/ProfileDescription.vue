<template>
    <div id="description_section" class="mb-60">
        <div class="title-profile">{{ __('Tell us briefly about yourself and your experience') }}</div>
        <div class="subtitle-profile">
            {{ __('(you can also indicate your preferences and directions in which you want to develop)') }}
        </div>
        <div class="mw-840">
            <textarea id="description" v-model="value" :name="name" :placeholder="__('Enter text')"
                      class="form-control"></textarea>
            <div v-if="errorMessage" class="form-text text-danger">{{ __('Tell us about yourself') }}</div>
        </div>
    </div>
</template>

<script>
import {useField} from "vee-validate";
import {watch} from "vue";

export default {
    name: "ProfileDescription",
    props: {
        modelValue: {
            type: String,
            default: ''
        },
        rules: {
            type: [String, Object],
            default: '',
        },
        name: {
            type: String,
            default: 'description',
        },
    },
    emits: ['update:modelValue'],
    setup(props, {emit}) {

        const {value, errorMessage} = useField(props.name, props.rules, {
            initialValue: props.modelValue,
            validateOnMount: false
        });

        watch(value, (val) => emit('update:modelValue', val));

        return {
            value,
            errorMessage,
        }
    }
}
</script>

<style lang="scss" scoped>
.form-control {
    height: 160px;
}
</style>
