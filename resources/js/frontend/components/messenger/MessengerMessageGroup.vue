<template>
    <div class="msgr-group" @click="makeSeen()">
        <div class="msgr-group-title"><span>{{ title }}</span></div>
        <div class="msgr-group-messages">
            <messenger-message-item
                v-for="(message, idx) in messages"
                :key="'msgr-msg-'+message.id"
                :is-fast="isFastMessage(idx)"
                :is-immediately="isImmediatelyMessage(idx)"
                :message="message"
            ></messenger-message-item>
        </div>
    </div>
</template>

<script>
import {computed} from "vue";
import moment from "moment";
import MessengerMessageItem from "./MessengerMessageItem";
import {useStore} from "vuex";

export default {
    name: "MessengerMessageGroup",
    components: {MessengerMessageItem},
    props: {
        date: String,
        messages: Array
    },
    setup(props) {
        const store = useStore();
        const title = computed(() => {
            return moment(props.date, "DD-MM-YYYY").format('MMMM, D');
        });

        const isFastMessage = (idx) => {
            if (idx === 0) return false;
            return props.messages[idx].from_id === props.messages[idx - 1].from_id &&
                moment(props.messages[idx - 1].created_at).add(15, 'minutes').isAfter(props.messages[idx].created_at);
        }

        const isImmediatelyMessage = (idx) => {
            if (idx === 0) return false;
            return props.messages[idx].from_id === props.messages[idx - 1].from_id &&
                moment(props.messages[idx - 1].created_at).add(10, 'minutes').isAfter(props.messages[idx].created_at);

        }

        return {
            title,
            makeSeen: async () => await store.dispatch('messenger/seen'),
            isFastMessage,
            isImmediatelyMessage,
        }
    }
}
</script>

<style scoped>

</style>
