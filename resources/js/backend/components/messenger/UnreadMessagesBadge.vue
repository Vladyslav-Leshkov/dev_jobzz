<template>
    <span  class="badge bg-warning text-dark" v-if="unreadCount > 0" v-cloak>{{unreadCount}}</span>
</template>

<script>
import {useStore} from "vuex";
import {computed} from "vue";

export default {
    name: "UnreadMessagesBadge",
    setup(props){
        const store = useStore();
        const unreadCount = computed(()=>store.state.messenger.unreadCount);
        return {
            unreadCount,
        }
    }
}
</script>

<style scoped>

</style>
