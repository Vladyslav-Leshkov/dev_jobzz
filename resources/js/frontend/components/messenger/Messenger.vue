<template>
    <div class="messenger-page">
        <div class="container-fluid container-xl messenger-page-body">
            <div class="messenger">
                <messenger-sidebar :class="{open: sidebarOpen}"/>
                <div class="msgr-chat">
                    <messenger-message-list v-if="selectedUser"/>
                    <messenger-message-sender v-if="selectedUser"/>
                    <div v-if="!selectedUser" class="d-flex h-100">
                        <div class="font-16 fw-bold text-center m-auto">
                            {{ __('Select a chat user') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</template>

<script>
import MessengerSidebar from "./MessengerSidebar";
import {useStore} from "vuex";
import MessengerMessageList from "./MessengerMessageList";
import MessengerMessageSender from "./MessengerMessageSender";
import {computed, onMounted} from "vue";
import SvgIcon from "../svg/SvgIcon";
import {useI18nLocal} from "../../store/composables/useI18nLocal";

export default {
    name: "Messenger",
    components: {
        SvgIcon,
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
    setup(props) {
        const store = useStore();

        store.commit('messenger/SET_CURRENT_USER', props.currentUser);
        store.commit('messenger/SET_CURRENT_CONTACTS', props.contacts);
        store.commit('messenger/SET_SUPPORT_USER', props.supportUser);
        const selectedUser = computed(() => store.state.messenger.selectedUser);
        const sidebarOpen = computed(() => store.state.messenger.sidebarOpen);

        store.dispatch('messenger/fetchContacts');
        let channel = `Messenger.User.${props.currentUser.id}`;
        if (props.currentUser.type === 'admin' || props.currentUser.type === 'support') {
            channel = 'Messenger.Support';
        }


        window.Echo.private(channel)
            .listen('MessageReceived', (data) => {
                store.dispatch('messenger/messageReceived', data.message);
            })
            .listen('MessageSeen', (data) => {
                store.dispatch('messenger/messagesSeen', data);
            })
            .listen('DataOpened', (data) => {
                store.dispatch('messenger/dataOpened', data.data);
            });

        return {
            selectedUser,
            sidebarOpen,

        }
    }
}
</script>

<style scoped>

</style>
