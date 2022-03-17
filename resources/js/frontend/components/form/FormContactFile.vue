<template>
    <div :class="groupClasses">
        <div class="form-control-group">

            <div :class="classes" class="form-control form-upload">
                <label :class="{attached: !!fileName}">
                    <input ref="fileInput" :accept="accept" :name="name + '_upload'" :required="required" class="d-none"
                           type="file"
                           @change="onFileChange()"/>
                    <span>{{ labelTitle }}</span>
                </label>
                <a v-if="innerValue" class="clear" href="#" @click.prevent="clearValue()">
                    <svg-icon icon="times" size="14"/>
                </a>
            </div>
            <label :for="id || name" class="form-label">{{ label }} <span v-if="required"
                                                                          class="text-danger">*</span></label>
            <div v-if="errorMessage" class="form-error position-absolute mt-0 right-0 font-12">{{ errorMessage }}</div>
            <label v-if="!required" class="check">
                <input v-model="used" :name="'use['+name+']'" :value="innerValue" type="checkbox"
                       @change="onUsedChange">
                <span></span>
            </label>
        </div>
    </div>
</template>

<script>
import {computed, ref} from "vue";
import {useField} from "vee-validate";
import {formFieldClasses, formGroupClasses} from "./useFromGroup";
import SvgIcon from "../svg/SvgIcon";
import {trans} from "../../i18n/lang";

export default {
    name: "FormContactFile",
    components: {SvgIcon},
    props: {
        name: String,
        label: String,

        id: [String, null],
        filedValue: String,
        placeholder: {
            type: String,
            default: trans('Attach file')
        },
        usedValue: {
            type: Boolean,
            default: true,
        },
        required: {
            type: Boolean,
            default: false,
        },
        rules: {
            type: [String, Object],
            default: ''
        },
        accept: {
            type: String,
            default: '.doc,.docx,.pdf'
        },
    },
    emits: ['update:filedValue', 'update:usedValue', 'change'],
    setup({name, rules, filedValue, usedValue, placeholder, required}, {emit}) {
        const fileInput = ref(null);
        const innerValue = ref(filedValue);
        const fileName = ref(filedValue);
        const used = ref(usedValue);

        const {errorMessage, meta} = useField(name, rules, {
            validateOnMount: false
        });

        const classes = computed(() => [...formFieldClasses(meta), !used.value && !required ? 'disabled' : 'enabled']);

        const groupClasses = computed(() => [...formGroupClasses(meta), 'form-floating form-contact-group']);

        const labelTitle = computed(() => fileName.value || placeholder);

        const onFileChange = () => {

            if (fileInput.value.files.length) {
                const file = fileInput.value.files[0];
                innerValue.value = file.name;
                fileName.value = file.name;
                emit('change', {file: file, name: fileName.value});
            } else {
                innerValue.value = '';
                fileName.value = '';
                emit('change', null);
            }

        }

        const clearValue = () => {
            innerValue.value = '';
            fileName.value = '';
            emit('change', null);
        }

        const onUsedChange = (e) => emit('update:usedValue', e.target.checked);

        return {
            fileInput,
            fileName,
            labelTitle,
            innerValue,
            errorMessage,
            groupClasses,
            classes,
            used,
            onFileChange,
            clearValue,
            onUsedChange,
        }
    },

}
</script>

<style scoped>

</style>
