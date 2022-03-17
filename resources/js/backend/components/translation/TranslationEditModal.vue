<template>
    <div class="modal fade" tabindex="-1" id="edit-line-modal" ref="modalRef">
        <div class="modal-dialog modal-lg">
            <form class="modal-content" method="post" @submit.prevent="saveItem()">
                <div class="modal-header">
                    <h5 class="modal-title">Редактировать перевод</h5>
                    <button type="button" class="btn-close" @click.prevent="cancelEdit()"></button>
                </div>
                <div class="modal-body">

                    <div class="row mb-1">
                        <div class="col-2 col-lg-1 text-bold">Ключ:</div>
                        <div class="col-10 col-lg-11">
                            <input type="text" class="form-control" readonly :value="itemKey">
                        </div>
                    </div>
                    <div v-for="locale in locales" class="row mb-1" :key="'lle-'+item.id+'-'+locale">
                        <div class="col-2 col-lg-1 text-bold">{{ locale.toUpperCase() }}</div>
                        <div class="col-10 col-lg-11">
                            <input type="text" class="form-control" v-model="item.text[locale]"
                                   :required="locale === 'ru'">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" @click.prevent="cancelEdit()">
                        Отмена
                    </button>
                    <button type="submit" class="btn btn-primary">
                        Сохранить
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
import {computed, ref} from "vue";
import {Modal} from "bootstrap";

export default {
    name: "TranslationEditModal",
    props: {
        locales: Array,
        item: Object,
    },
    setup(props, {emit}) {

        const modalRef = ref(null);

        const show = () => {
            const modal = Modal.getOrCreateInstance(modalRef.value);
            modal.show();
        }

        const hide = () => {
            const modal = Modal.getOrCreateInstance(modalRef.value);
            modal.hide();
        }

        const itemKey = computed(() => {
            return props.item.group === '*' ? props.item.key : props.item.group + '.' + props.item.key
        })

        const saveItem = () => {
            hide();
            emit('save', props.item);
        };

        const cancelEdit = () => {
            hide();
            emit('cancel', props.item);
        };

        return {
            modalRef,
            itemKey,
            saveItem,
            cancelEdit,
            show,
            hide,
        }
    }
}
</script>

<style scoped>

</style>