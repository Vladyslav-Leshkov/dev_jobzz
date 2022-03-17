<template>
    <a :href="message.url || '#'" class="list-group-item" @click.prevent="markRead()">
        <div class="row g-0 align-items-center">
            <div class="col-12">
                <div class="text-dark">{{ message.title }}</div>
                <div class="text-muted small mt-1" v-html="message.message"></div>
                <div class="text-muted small mt-1">{{ message.time }}</div>
            </div>
        </div>
    </a>
</template>

<script>
export default {
    name: "HeaderNotificationItem",
    props: {
        message: Object,
    },
    emits: ['mark-read'],
    setup(props, {emit}) {
        const markRead = () => {
            emit('mark-read', props.message);
        }
        return {
            markRead,
        }
    }
}
</script>

<style scoped>

</style>
