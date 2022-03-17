<template>
    <div class="recruiter-confirm-wrp">
        <div class="d-flex recruiter-item-row align-items-center">
            <div class="mb-20">
                <a href="#" class="recruiter-confirm-toggle" :class="{active: chatOpen}"
                   @click.prevent="toggleMessages()">
                    <svg-icon icon="chat" size="24"/>
                    {{ __('Show recent chat messages') }}
                    <svg-icon icon="chevron-down" size="18" class="chevron"/>
                </a>
            </div>
            <div class="mb-20">
                <vacancy-hiring-btn :offer="offer" :from-candidate="true"/>
            </div>
        </div>
        <div v-if="chatOpen" class="recruiter-confirm-messages">
            <spinner v-if="requestMessages"/>
            <messenger-message-item v-for="message in messages" :message="message" :key="'msg-'+message.id"
                                    :current-user="currentUser"/>
        </div>

    </div>
</template>

<script>
import SvgIcon from "../svg/SvgIcon";
import {ref} from "vue";
import {axiosGet} from "../../services/api";
import MessengerMessageItem from "../messenger/MessengerMessageItem";
import Spinner from "../common/Spinner";
import VacancyHiringBtn from "../vacancy/VacancyHiringBtn";
export default {
    name: "RecruiterConfirm",
    components: {VacancyHiringBtn, Spinner, MessengerMessageItem, SvgIcon},
    props: {
        offer: Object,
        currentUser: Object,
    },
    setup(props){
        const chatOpen = ref(false);
        const request = ref(false);
        const requestMessages = ref(false);

        const messages = ref([]);

        const onSubmit = () => {

        }

        const toggleMessages = async () => {
            if(!chatOpen.value){
                chatOpen.value = true;
                if(messages.value.length === 0){
                    requestMessages.value = true;
                    messages.value = await axiosGet(`/messenger/${props.offer.recruiter_id}/last-messages`);
                    requestMessages.value = false;
                }
            }else{
                chatOpen.value = false;
            }
        }

        return{
            chatOpen,
            request,
            messages,
            requestMessages,
            onSubmit,
            toggleMessages,
        }
    }
}
</script>

<style scoped>

</style>
