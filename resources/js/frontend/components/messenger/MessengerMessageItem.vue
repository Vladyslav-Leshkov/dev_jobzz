<template>
    <div
        :class="{unread : isUnread, outgoing: isOutgoing, fast: isFast, immediately: isImmediately, edited: message.edited, editing: isEditing}"
        class="msgr-message">
        <div class="msgr-avatar">
            <img v-if="fromUser.has_avatar || !fromUser.initials" :alt="fromUser.name" :src="fromUser.avatar_url">
            <span class="msgr-initials" v-if="!fromUser.has_avatar && fromUser.initials">{{ fromUser.initials }}</span>
        </div>
        <div class="msgr-message-body">
            <div v-show="!isImmediately" class="msgr-contact-title">
                <div class="msgr-contact-name" v-if="!fromUser.url">{{ fromUser.name }}</div>
                <a v-if="fromUser.url" :href="fromUser.url" class="msgr-contact-name">{{ fromUser.name }}</a>
                <div class="msgr-contact-time">
                    <span v-if="messageTime">{{ messageTime }}</span>
                    <i v-if="isOutgoing" :class="{active: message.seen, send: message.token}"
                       class="msgr-message-status"
                    ></i>
                </div>
            </div>
            <div class="msgr-message-text-wrp">
                <div class="msgr-message-text">
                    <div v-html="message.body" class="msg-txt" :class="{edited: message.edited}"></div>

                    <a v-if="canEdit" href="#" @click.prevent="editMessage()" class="msgr-message-edit"
                       title="Редактировать сообщение">
                        <svg-icon icon="pen"/>
                    </a>
                    <span v-if="!canEdit && message.edited" class="msgr-message-edit" title="Измененно">
                        <svg-icon icon="pen"/>
                    </span>
                </div>

            </div>


        </div>
    </div>
</template>

<script>
import {computed} from "vue";
import {useStore} from "vuex";
import moment from "moment";
import SvgIcon from "../svg/SvgIcon";

export default {
    name: "MessengerMessageItem",
    components: {SvgIcon},
    props: {
        message: Object,
        isFast: Boolean,
        isImmediately: Boolean,
        currentUser: Object,
    },
    setup(props) {
        const store = useStore();

        const fromUser = computed(() => props.message.from_user);
        const currentUser = computed(() => store.state.messenger.currentUser || props.currentUser);
        const isCurrentSupport = computed(() => store.getters['messenger/isCurrentSupport']);
        const currentId = computed(() => isCurrentSupport.value ? 2 : (currentUser.value ? currentUser.value.id : 0));
        const canEdit = computed(() => {
            return props.message.type === 'message' && currentId.value === fromUser.value.id
        });
        const selectedMessage = computed(() => store.state.messenger.selectedMessage);

        const isUnread = computed(() => props.message.seen === false && props.message.to_id === currentId.value);
        const messageTime = computed(() => moment.utc(props.message.created_at).local().format('HH:mm'));

        const editMessage = () => {
            store.dispatch('messenger/editMessage', props.message);
        }

        const isEditing = computed(() => selectedMessage.value && selectedMessage.value.id === props.message.id);
        const isOutgoing = computed(() => fromUser.value.id === currentId.value);

        return {
            fromUser,
            currentUser,
            isUnread,
            currentId,
            messageTime,
            canEdit,
            editMessage,
            isEditing,
            isOutgoing,
        }
    }
}
</script>

<style scoped>

</style>
