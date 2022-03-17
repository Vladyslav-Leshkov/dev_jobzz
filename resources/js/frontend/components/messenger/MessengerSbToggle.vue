<template>
    <a :class="{active: sidebarOpen}" class="navbar-toggler sidebar-toggle me-15"
       href="#"
       @click.prevent="toggleSidebar"
    >
        <span></span>
        <span></span>
        <span></span>
    </a>
</template>

<script>
import {computed} from "vue";
import {useStore} from "vuex";

export default {
    name: "MessengerSbToggle",
    setup() {
        const store = useStore();
        const sidebarOpen = computed(() => store.state.messenger.sidebarOpen);
        return {
            sidebarOpen,
            toggleSidebar: () => store.dispatch('messenger/toggleSidebar'),
        }
    }
}
</script>

<style scoped>

</style>