<template>
    <div ref="modal" class="modal fade">
        <div :class="['modal-'+size]" class="modal-dialog">
            <div class="modal-content">
                <div v-if="closeBtn" class="d-flex justify-content-end  pt-2 pe-2">
                    <a href="#" type="button" @click.prevent="hide()">
                        <svg-icon class="me-10" icon="times-red"/>
                    </a>
                </div>
                <slot></slot>
            </div>
        </div>
    </div>
</template>

<script>
import {ref, onMounted, watch, onUnmounted} from "vue";
import {Modal} from 'bootstrap';

export default {
    name: "BsModal",
    props: {
        options: {
            type: Object,
            default() {
                return {}
            }
        },
        size: {
            type: String,
            default: 'md'
        },
        closeBtn: Boolean,
        opened: Boolean,
    },
    emits: [
        'bs-show',
        'bs-shown',
        'bs-hide',
        'bs-hide-prevented',
        'bs-hidden',
    ],
    setup(props, {emit}) {
        const modal = ref(null);
        const visible = ref(props.opened);
        const dialog = ref(null);

        onMounted(() => {
            dialog.value = Modal.getInstance(modal.value);
            if (!dialog.value) {
                const options = Object.assign({
                    backdrop: true,
                    keyboard: true,
                    focus: true,
                }, props.options);

                dialog.value = new Modal(modal.value, options);

                modal.value.addEventListener('show.bs.modal', (evt) => {
                    emit('bs-show', evt);
                });
                modal.value.addEventListener('shown.bs.modal', (evt) => {
                    emit('bs-shown', evt);
                });
                modal.value.addEventListener('hide.bs.modal', (evt) => {
                    emit('bs-hide', evt);
                });
                modal.value.addEventListener('hidden.bs.modal', (evt) => {
                    emit('bs-hidden', evt);
                });
                modal.value.addEventListener('hidePrevented.bs.modal', (evt) => {
                    emit('bs-hide-prevented', evt);
                });
            }
        });

        onUnmounted(() => {
            dialog.value.dispose();
        });

        watch(() => props.opened, (val) => {
            if (val !== visible.value) {
                if (val) {
                    show();
                } else {
                    hide();
                }
            }
        });

        const show = () => {
            visible.value = true;
            dialog.value.show();
        };
        const hide = () => {
            visible.value = false
            dialog.value.hide();
        };
        const toggle = () => {
            visible.value = !visible.value;
            if (visible.value) {
                show();
            } else {
                hide();
            }
        };

        return {
            modal,
            visible,
            show,
            hide,
            toggle,
        }
    }
}
</script>

<style scoped>

</style>
