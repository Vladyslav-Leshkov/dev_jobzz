<template>
    <li class="dropdown">
        <a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-bs-toggle="dropdown">
            <div class="position-relative">
                <i class="align-middle" data-feather="bell"></i>
                <span class="indicator" v-if="messages.length">{{messages.length}}</span>
            </div>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="alertsDropdown">
            <div class="dropdown-menu-header">
                {{messages_title}}
            </div>
            <div class="list-group">
                <header-notification-item
                    v-for="message in messages"
                    :message="message"
                    :key="'note-'+message.id"
                    @mark-read="markRead"
                ></header-notification-item>

            </div>
            <div class="dropdown-menu-footer">
                <a href="/admin/notifications" class="text-muted">Показать все уведомления</a>
            </div>
        </div>
    </li>

</template>

<script>
import {computed} from "vue";
import {useStore} from "vuex";
import {pluralizeValue} from "../../utils/string";
import HeaderNotificationItem from "./HeaderNotificationItem";
import playSound from "../../modules/play-notification";

export default {
    name: "HeaderNotifications",
    components: {HeaderNotificationItem},
    setup(){
        const store = useStore();
        const messages = computed(()=>store.state.notifications.messages);
        const messages_title = computed(()=>{
            return pluralizeValue(messages.value.length, 'новое уведомление', 'новых уведомлений', 'новых уведомлений')
        });

        store.dispatch('notifications/loadMessages');

        Echo.private(`Admin.Notifications`)
            .listen('AdminNotificationEvent', (e) => {
                console.log(e);
                console.log(e.notification);
                store.commit('notifications/ADD_MESSAGE', e.notification);
                playSound();
            });

        const markRead = async (message) => {
            await store.dispatch('notifications/markRead', message.id);
            if (message.url && message.url !== '#') {
                document.location.href = message.url;
            }
        }
        return {

            messages,
            messages_title,
            markRead,
        }
    }
}
</script>

<style scoped>

</style>
