<template>
    <div class="list-group-item">
        <div class="row mb-1">
            <div class="col-3 col-lg-2 text-bold">Ключ:</div>
            <div class="col-9 col-lg-10">
                <input type="text" class="form-control form-control-sm" readonly
                       :value="item.group === '*' ? item.key : item.group + '.'+item.key">
            </div>
        </div>
        <div v-for="locale in locales" class="row mb-1" :key="'ll-'+item.id+'-'+locale">
            <div class="col-3 col-lg-2 text-bold">{{ locale.toUpperCase() }}</div>
            <div class="col-9 col-lg-10">
                <input type="text" class="form-control form-control-sm" readonly :value="item.text[locale]">
            </div>
        </div>
        <div class="row">
            <div class="col-3 col-lg-2 text-bold">Действия:</div>
            <div class="col-9 col-lg-10">
                <a href="#" @click.prevent="editItem(item)"
                   class="btn btn-sm btn-outline-primary">Редактировать</a>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "TranslationItem",
    props: {
        item: Object,
        locales: Array,
    },
    setup(props, {emit}) {
        const editItem = () => emit('edit', props.item);
        return {
            editItem,
        }
    }
}
</script>

<style scoped>

</style>