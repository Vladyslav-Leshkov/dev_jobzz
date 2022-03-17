<template>
    <div v-if="user"
         :class="{active: activeClass, unread: unreadClass}"
         class="msgr-contact-item"
         @click="setUser()">
        <div class="msgr-avatar msgr-avatar-support">
            <img alt="Jobzz Support" src="/images/support.png">
            <span class="status online"></span>
        </div>
        <div class="msgr-contact">
            <div class="msgr-contact-title">
                <div class="msgr-contact-name">{{ user.name }}</div>
                <div class="msgr-contact-time">
                    <i v-if="user.last_message !== null"
                       :class="{active: user.last_message.seen}"
                       class="msgr-message-status"
                    ></i>
                    <span>{{ messageTime }}</span>
                </div>
            </div>
            <!--            <div class="msgr-contact-message" v-html="messageText"></div>-->

        </div>
    </div>
</template>

<script>
import {useStore} from "vuex";
import {computed, ref} from "vue";
import moment from "moment";

export default {
    name: "MessengerSupportItem",
    setup() {
        const store = useStore();
        const user = computed(() => store.state.messenger.supportUser);
        const currentUser = computed(() => store.state.messenger.currentUser);

        const selectedUser = computed(() => store.state.messenger.selectedUser);

        const setUser = () => {
            store.dispatch('messenger/changeUser', user.value);
            store.dispatch('messenger/seen', {
                user_id: user.value.id,
                last_id: user.value.last_message ? user.value.last_message.id : 0
            });
            store.dispatch('messenger/toggleSidebar', false);
        }

        const messageText = computed(() => {
            if (!user.value || user.value.last_message === null) {
                return 'Напишите сообщение';
            }
            let mes = user.value.last_message.from_id === currentUser.id ? '<b>Вы:</b>' : `<b>${user.value.first_name}:</b>`;
            mes += user.value.last_message.short;
            return mes;
        });

        const messageTime = computed(() => {
            if (!user.value || user.value.last_message === null) {
                return '';
            }
            return moment.utc(user.value.last_message.created_at).local().format('HH:mm');
        });

        const unreadClass = computed(() => {
            return user.value.last_message && !user.value.last_message.seen && user.value.last_message.from_id !== currentUser.value.id;
        });

        const activeClass = computed(() => {
            return selectedUser.value && selectedUser.value.id === user.value.id;
        });

        return {
            user,
            currentUser,
            messageText,
            messageTime,
            selectedUser,
            setUser,
            unreadClass,
            activeClass,
        }
    }
}
</script>

<style scoped>

</style>
