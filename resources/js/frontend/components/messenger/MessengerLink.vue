<template>
    <a :href="href" class="d-inline-flex align-items-center">
        <span v-if="unreadCount" class="badge badge-info me-5">{{ unreadCount }}</span>
        <span>{{ __('Messages') }}</span>
    </a>
</template>

<script>
import {computed} from "vue";
import {useStore} from "vuex";
import playSound from "../../../modules/play-notification";

export default {
    name: "MessengerLink",
    props: {
        href: String,
        user: Object
    },
    setup(props) {
        const store = useStore();
        const unreadCount = computed(() => store.state.messenger.unreadCount);


        let channel = `Messenger.User.${props.user.id}`;
        if (props.user.type === 'admin' || props.user.type === 'support') {
            channel = 'Messenger.Support';
        }

        store.dispatch('messenger/fetchUnread');

        window.Echo.private(channel)
            .listen('MessageReceived', (data) => {
                store.dispatch('messenger/fetchUnread');
                if (channel === 'Messenger.Support') {
                    playSound();
                }
            })

        return {
            unreadCount,
        }
    }
}
</script>

<style scoped>

</style>
