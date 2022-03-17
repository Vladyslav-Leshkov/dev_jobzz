<template>
    <div class="avatar-cropper-wrp mb-30">
        <img :src="src" alt="" ref="imgRef" class="avatar-cropper-img">
    </div>
    <div class="avatar-cropper-actions mb-20">
        <button class="btn btn-primary px-40 rounded-pill" @click.prevent="crop()">ОК</button>
    </div>
</template>

<script>
import {onMounted, onUnmounted, ref, watch} from "vue";
import Cropper from 'cropperjs';

export default {
    name: "AvatarCropper",
    props: {
        src: String,
        ratio: {
            type: Number,
            default: 1
        },
    },
    emits: ['done'],
    setup(props, {emit}) {
        const imgRef = ref(null);
        const cropper = ref(null);
        const init = () => {
            if (cropper.value) {
                cropper.value.destroy();
            }

            cropper.value = new Cropper(imgRef.value, {
                aspectRatio: props.ratio,
                viewMode: 0,
                //autoCrop: false,
                autoCropArea: 1,
                movable: false,
                rotatable: false,
                scalable: false,
                zoomable: false,
                minContainerWidth: 300,
                minContainerHeight: 300,
            });
            cropper.value.reset();
        }

        onUnmounted(() => {
            if (cropper.value) {
                cropper.value.destroy();
            }
        })

        watch(() => props.src, () => init());

        const crop = () => {
            const data = cropper.value.getData(true);
            const canvas = cropper.value.getCroppedCanvas();
            emit('done', {data: data, src: canvas.toDataURL()})
        }

        return {
            imgRef,
            init,
            crop,
        }
    }
}
</script>

<style scoped>

</style>