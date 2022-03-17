<template>
    <div
        :class="{ active: selectedUser && selectedUser.id === user.id, unread:  lastMessage && !lastMessage.seen && lastMessage.from_id !== currentUser.id}"
        class="msgr-contact-item"
        @click="setUser()">
        <div class="msgr-avatar">
            <img :alt="user.name" v-if="user.has_avatar || !user.initials" :src="user.avatar_url">
            <span class="msgr-initials" v-if="!user.has_avatar && user.initials">{{ user.initials }}</span>
            <span :class="{online: user.is_online}" class="status"></span>
        </div>
        <div class="msgr-contact">
            <div class="msgr-contact-title">
                <div class="msgr-contact-name">{{ user.name }}</div>
                <div class="msgr-contact-time">
                    <i v-if="lastMessage !== null"
                       :class="{active: lastMessage.seen}"
                       class="msgr-message-status"
                    ></i>
                    <span>{{ messageTime }}</span>
                </div>
            </div>
            <div v-if="user.position" class="msgr-message-position" v-html="user.position"></div>
            <!--            <div class="msgr-contact-message" v-html="messageText"></div>-->
        </div>
    </div>
</template>

<script>
import {useStore} from "vuex";
import {computed, ref, watch} from "vue";
import {trans} from "../../i18n/lang";
import moment from "moment";

export default {
    name: "MessengerContactItem",
    props: {
        user: Object,
    },
    setup({user}) {
        const lastMessage = ref(user.last_message);
        const store = useStore();
        const currentUser = computed(() => store.state.messenger.currentUser);

        const selectedUser = computed(() => store.state.messenger.selectedUser);

        const setUser = () => {
            store.dispatch('messenger/changeUser', user);
            store.dispatch('messenger/seen', {user_id: user.id, last_id: user.last_message ? user.last_message.id : 0});
            store.dispatch('messenger/toggleSidebar', false);
        }

        watch(user, (val) => {
            lastMessage.value = val.last_message;
        });

        const messageText = computed(() => {
            if (lastMessage.value === null) {
                return trans('Write a message');
            }
            let mes = lastMessage.value.from_id === user.id ? `<b>${user.first_name}:</b> ` : '<b>' + trans('You') + ':</b> ';
            mes += lastMessage.value.short;
            return mes;
        });

        const messageTime = computed(() => {
            return lastMessage.value === null ? '' : moment.utc(lastMessage.value.created_at).local().format('HH:mm');
        })

        return {
            currentUser,
            messageText,
            messageTime,
            selectedUser,
            lastMessage,
            setUser,
        }
    }
}
</script>

<style scoped>

</style>
