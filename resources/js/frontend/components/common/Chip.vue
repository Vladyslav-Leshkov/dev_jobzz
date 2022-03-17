<template>
    <span class="chip">
        <slot />
        <a href="#" class="close" v-if="dismisable" @click.prevent="close()"></a>
    </span>
</template>

<script>
export default {
    name: "Chip",
    props: {
        item: {
            type: Object,
            default(){
                return {
                    id: 0,
                    title: ''
                }
            }
        },
        dismisable: Boolean
    },
    setup(props, {emit}){
        const close = () => emit('close', props.item);
        return {
            close,
        }
    }
}
</script>

<style scoped>

</style>
