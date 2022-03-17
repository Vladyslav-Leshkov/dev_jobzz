<template>
    <div>
        <div class="form-text text-end mt-0" v-if="!required">{{ __('not necessary') }}</div>
        <label class="form-info__file" :class="{attached: !!fileName}">
            <input ref="fileInput" class="d-none" type="file" :accept="accept" :name="name" @change="onFileChange()" />
            <span>{{labelTitle}}</span>
        </label>
    </div>
</template>

<script>
import {computed, ref, watch} from 'vue';
import {useRequiredFormGroup} from "./useFromGroup";
import {trans} from "../../i18n/lang";
export default {
    name: "FileUploader",
    props: {
        label: {
            type: String,
            default: trans('Attach file')
        },
        name: {
            type: String,
            required: true,
        },
        value: {
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
        const fileName = ref(props.value);
        const labelTitle = computed(()=> fileName.value || props.label);

        const onFileChange = ()=> {

            if(fileInput.value.files.length){
                const file = fileInput.value.files[0];
                fileName.value = file.name;
                emit('change', {file: file, name: fileName.value});
            }else{
                fileName.value = '';
                emit('change', null);
            }

        }

        return {
            fileInput,
            labelTitle,
            fileName,
            onFileChange,
            ...useRequiredFormGroup(props.rules)
        }
    }
}
</script>

<style scoped>

</style>
