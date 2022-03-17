<template>
    <li class="nav-item dropdown">
        <a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown" data-bs-toggle="dropdown">
            <div class="position-relative">
                <i class="align-middle" data-feather="message-square"></i>
                <span v-if="unreadCount > 0" class="indicator">{{unreadCount}}</span>
            </div>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="messagesDropdown">
            <div class="dropdown-menu-header">
                <div class="position-relative">
                    {{unreadTitle}}
                </div>
            </div>
            <div class="list-group">
                <nav-message-item v-for="message in messages" :message="message" :key="'message-'+message.id" />
            </div>
            <div class="dropdown-menu-footer">
                <a href="/admin/messenger" class="text-muted">Перейти к сообщениям</a>
            </div>
        </div>
    </li>

</template>

<script>
import {useStore} from "vuex";
import {computed} from "vue";
import NavMessageItem from "./NavMessageItem";
import {pluralizeValue} from "../../../utils/string";
import playSound from "../../../modules/play-notification";

export default {
    name: "NavMessages",
    components: {NavMessageItem},
    props: {
        href: String,
        user: Object
    },
    setup(props){
        const store = useStore();
        const unreadCount = computed(()=>store.state.messenger.unreadCount);
        const messages = computed(()=>store.state.messenger.unreadMessages);
        let channel = 'Messenger.Support';


        store.dispatch('messenger/fetchUnreadMessages');

        window.Echo.private(channel)
            .listen('MessageReceived',  (data) => {
                store.dispatch('messenger/fetchUnreadMessages');
                playSound();
            })

        let unreadTitle = computed(()=>{
            return  pluralizeValue(unreadCount.value, 'Новое сообщение', 'Новых сообщений', 'Новых сообщений')
        })

        return {
            unreadCount,
            unreadTitle,
            messages,
        }
    }
}
</script>

<style scoped>

</style>
