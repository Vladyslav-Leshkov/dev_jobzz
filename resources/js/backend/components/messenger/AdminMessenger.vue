<template>
    <div class="messenger admin-messenger">
        <messenger-sidebar :class="{open: sidebarOpen}" />
        <div class="msgr-chat">
            <messenger-message-list  v-if="selectedUser" />
            <messenger-message-sender  v-if="selectedUser" />
        </div>
    </div>
</template>

<script>
import MessengerSidebar from "../../../frontend/components/messenger/MessengerSidebar";
import {useStore} from "vuex";
import MessengerMessageList from "../../../frontend/components/messenger/MessengerMessageList";
import MessengerMessageSender from "../../../frontend/components/messenger/MessengerMessageSender";
import {computed, onMounted} from "vue";
import * as URLService from '../../../utils/url';

export default {
    name: "AdminMessenger",
    components: {
        MessengerMessageSender,
        MessengerMessageList,
        MessengerSidebar,
    },
    props: {
      pageTitle: String,
      currentUser: Object,
      supportUser: Object,
      contacts: Object,
    },
    setup(props){
        const store = useStore();
        const user_id = URLService.getQueryParam('user_id', 0);
        if(user_id > 0){
            localStorage.setItem('MESSENGER_SELECTED_USER_ID', user_id);
            URLService.updateQuery('/admin/messenger');
        }

        store.commit('messenger/SET_CURRENT_USER', props.currentUser);
        store.commit('messenger/SET_CURRENT_CONTACTS', props.contacts);
        store.commit('messenger/SET_SUPPORT_USER', props.supportUser);
        const selectedUser = computed(()=> store.state.messenger.selectedUser);
        const sidebarOpen = computed(()=> store.state.messenger.sidebarOpen);

        store.dispatch('messenger/fetchContacts');

        let channel = `Messenger.Support`;


        window.Echo.private(channel)
            .listen('MessageReceived',  (data) => {
                store.dispatch('messenger/messageReceived', data.message);
            })
            .listen('MessageSeen',  (data) => {
                store.dispatch('messenger/messagesSeen', data);
            });

        return{
            selectedUser,
            sidebarOpen,
        }
    }
}
</script>

<style scoped>

</style>
