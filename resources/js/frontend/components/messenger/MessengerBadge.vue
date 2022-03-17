<template>
    <span v-if="unreadCount" class="badge badge-info">{{ unreadCount }}</span>
</template>

<script>
import {computed} from "vue";
import {useStore} from "vuex";
import playSound from "../../../modules/play-notification";

export default {
    name: "MessengerLink",
    setup(props) {
        const store = useStore();
        const unreadCount = computed(() => store.state.messenger.unreadCount);
        return {
            unreadCount,
        }
    }
}
</script>

<style scoped>

</style>
