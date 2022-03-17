<template>
    <div>
        <div v-if="!notes" class="form-text text-end mt-0">{{ notes }}</div>

        <label ref="uploader" :class="{dragover: dragover}" class="avatar-uploader" @dragleave="onDragleave"
               @dragover="onDragover" @drop="onDrop">
            <input ref="fileInput" :accept="accept" :name="name" class="file-input" type="file" @change="onFileChange">
            <span :class="{logo: isLogo}" class="preview">
                <img v-if="fileSrc" :src="fileSrc" alt="Avatar">
            </span>
            <span class="text">
                <strong>{{ title }}</strong>
                <b class="mt-8" v-html="__('Drag the file here <br> or upload from your device')"></b>
            </span>
        </label>
        <input v-if="crop" type="hidden" :name="name+'_crop'" :value="cropData">
        <bs-modal v-if="crop" ref="cropperModal" :options="{backdrop: 'static'}" close-btn>
            <div class="modal-body">
                <avatar-cropper :src="fileSrc" :ratio="cropRatio" @done="cropperDone" ref="cropperRef"/>
            </div>
        </bs-modal>
    </div>

</template>

<script>
import {nextTick, ref} from "vue";
import {useRequiredFormGroup} from "./useFromGroup";
import {trans} from "../../i18n/lang";
import AvatarCropper from "./AvatarCropper";
import BsModal from "../bootstrap/BsModal";

export default {
    name: "AvatarUploader",
    components: {BsModal, AvatarCropper},
    props: {
        title: {
            type: String,
            default: trans('Your avatar')
        },
        label: {
            type: String,
            default: trans('Attach file')
        },
        name: {
            type: String,
            required: true,
        },
        notes: {
            type: String,
            default: ''
        },
        value: {
            type: String,
            default: ''
        },
        accept: {
            type: String,
            default: '.jpg,.png,.jpeg'
        },
        rules: {
            type: [String, Object],
            default: ''
        },
        isLogo: Boolean,
        crop: {
            type: Boolean,
            default: true,
        },
        cropRatio: {
            type: Number,
            default: 1,
        },
    },
    emits: ['change'],
    setup(props, {emit}) {

        const cropperModal = ref(null);
        const cropperRef = ref(null);
        const uploader = ref(null);
        const fileInput = ref(null);
        const dragover = ref(false);

        const selectedFile = ref(null);
        const fileSrc = ref(props.value);
        const cropData = ref('');

        const onDragleave = () => {
            dragover.value = false;
        }

        const onDragover = (event) => {
            event.preventDefault();
            dragover.value = true;
        }

        const onFileChange = () => {

            if (fileInput.value.files.length) {
                const file = fileInput.value.files[0];
                const reader = new FileReader();
                reader.onload = (pe) => {
                    cropData.value = '';
                    selectedFile.value = file;
                    fileSrc.value = pe.target.result;
                    emit('change', {file: file.value, src: fileSrc.value});
                    if (props.crop) {
                        cropperModal.value.show();
                        nextTick(() => {
                            cropperRef.value.init();
                        });
                    }


                }
                reader.readAsDataURL(file);
            } else {
                selectedFile.value = null;
                fileSrc.value = '';
                cropData.value = '';
                emit('change', {file: null, src: null});
            }

        }

        const onDrop = (event) => {
            event.preventDefault();
            fileInput.value.files = event.dataTransfer.files;
            onFileChange();
        }

        const cropperDone = (cropResult) => {
            cropData.value = JSON.stringify(cropResult.data);
            fileSrc.value = cropResult.src;
            cropperModal.value.hide();
            emit('change', {file: selectedFile.value, src: cropResult.src});
        }

        return {
            cropperModal,
            cropperRef,
            uploader,
            fileInput,
            fileSrc,
            cropData,
            dragover,
            onDrop,
            onDragover,
            onDragleave,
            onFileChange,
            cropperDone,
            ...useRequiredFormGroup(props.rules)
        }
    }
}
</script>

<style scoped>

</style>
