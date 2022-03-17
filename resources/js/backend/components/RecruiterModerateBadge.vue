<template>
    <span class="badge bg-warning text-dark ms-5"
          v-if="unreadCount > 0" v-cloak
          title="На модерации">{{ unreadCount }}</span>
</template>

<script>
import {useStore} from "vuex";
import {computed, ref} from "vue";
import playSound from "../../modules/play-notification";

export default {
    name: "UnreadMessagesBadge",
    props: {
        count: Number
    },
    setup(props) {
        const unreadCount = ref(props.count);

        Echo.private(`Admin.Notifications`)
            .listen('NewRecruiterRegistration', (e) => {
                unreadCount.value = e.count;
            });

        return {
            unreadCount,
        }
    }
}
</script>

<style scoped>

</style>
