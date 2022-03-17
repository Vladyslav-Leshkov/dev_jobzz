<template>
    <div :class="groupClasses">

        <div v-if="label" class="form-label" :class="{required: required}">{{label}}</div>
        <div class="form-control-group">
            <input type="hidden" :name="name" :value="innerValue">
            <div class="form-control form-upload">
                <label :class="{attached: !!fileName}">
                    <input ref="fileInput" class="d-none" type="file" :accept="accept" :name="name + '_upload'" @change="onFileChange()" />
                    <span>{{labelTitle}}</span>
                </label>
                <a href="#" v-if="innerValue" @click.prevent="clearValue()" class="clear"><svg-icon icon="times" size="14" /></a>
            </div>

            <div class="form-note" v-if="notes">{{ notes }}</div>
            <div class="form-error" v-if="errorMessage">{{ errorMessage }}</div>
            <div class="form-text" v-if="formText && !errorMessage">{{ formText }}</div>
        </div>



    </div>
</template>

<script>
import {useField} from "vee-validate";
import {computed, ref} from "vue";
import {formGroupClasses, useRequiredFormGroup} from "./useFromGroup";
import SvgIcon from "../svg/SvgIcon";
import {trans} from "../../i18n/lang";

export default {
    name: "FormUploadGroup",
    components: {SvgIcon},
    props: {
        label: {
            type: String,
            default: ''
        },
        name: {
            type: String,
            required: true,
        },
        value: {
            type: String,
            default: ''
        },
        fileName: {
            type: String,
            default: ''
        },
        placeholder: {
            type: String,
            default: trans('Attach file')
        },
        notes: {
            type: String,
            default: ''
        },
        formText: {
            type: String,
            default: ''
        },
        accept: {
            type: String,
            default: '.*'
        },
        rules: {
            type: [String, Object],
            default: ''
        },
    },
    emits: ['change'],
    setup(props, {emit}){

        const fileInput = ref(null);
        const fileName = ref(props.fileName);
        const innerValue = ref(props.value);

        const labelTitle = computed(()=> fileName.value || props.placeholder);
        const { errorMessage, meta } = useField(props.name, props.rules, {
            validateOnMount: false
        });
        const groupClasses = computed(()=> [...formGroupClasses(meta), 'form-group']);

        const onFileChange = ()=> {

            if(fileInput.value.files.length){
                const file = fileInput.value.files[0];
                innerValue.value = '';
                fileName.value = file.name;
                emit('change', {file: file, name: fileName.value});
            }else{
                innerValue.value = '';
                fileName.value = '';
                emit('change', null);
            }

        }

        const clearValue = ()=> {
            innerValue.value = '';
            fileName.value = '';
            emit('change', null);
        }

        return {
            fileInput,
            labelTitle,
            fileName,
            errorMessage,
            groupClasses,
            innerValue,
            onFileChange,
            clearValue,
            ...useRequiredFormGroup(props.rules)
        }
    }
}
</script>

<style scoped>

</style>
