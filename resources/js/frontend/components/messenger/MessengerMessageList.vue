<template>
    <div ref="container" class="msgr-messages-list">
        <div ref="wrapper" class="msgr-messages-items">
            <a v-if="lastPage > currentPage && !loader" class="btn btn-sm rounded-pill btn-outline-info mx-auto mb-20"
               href="#"
               @click.prevent="fetch()">{{ __('Previous messages') }}</a>
            <spinner v-if="loader" class="mb-15"></spinner>
            <messenger-message-group
                v-for="group in messageGroups"
                :key="'msg-g-'+group.date"
                :date="group.date"
                :messages="group.messages"
            ></messenger-message-group>
            <div v-if="!loader && messageGroups.length === 0" class="d-flex h-100">
                <div class="font-16 fw-bold text-center m-auto">
                    {{ __('Write a message') }}
                </div>
            </div>
        </div>

    </div>
</template>

<script>
import {useStore} from "vuex";
import {computed, nextTick, onMounted, onUnmounted, ref, watch} from "vue";
import MessengerMessageGroup from "./MessengerMessageGroup";
import PerfectScrollbar from "perfect-scrollbar";
import Spinner from "../common/Spinner";
import {useI18nLocal} from "../../store/composables/useI18nLocal";

export default {
    name: "MessengerMessageList",
    components: {Spinner, MessengerMessageGroup},
    setup() {


        const store = useStore();
        const mounted = ref(false);
        const autoScroll = ref(false);
        const container = ref(null);
        const wrapper = ref(null);
        const ps = ref(null);

        const currentPage = computed(() => store.state.messenger.messages_current_page);
        const lastPage = computed(() => store.state.messenger.messages_last_page);
        const loader = computed(() => store.state.messenger.loading_messages);

        const messages = computed(() => store.state.messenger.messages);
        const messageGroups = computed(() => store.getters['messenger/messagesGroups']);

        const scrollToBottom = () => {
            setTimeout(() => {
                let scrollTo = wrapper.value.offsetHeight - container.value.offsetHeight + 35;
                if (scrollTo > 0) {
                    container.value.scrollTop = scrollTo;
                }
            }, 100);
        }

        const fetch = async () => {
            store.commit('messenger/SET_MESSAGES_CURRENT_PAGE', currentPage.value + 1);
            await store.dispatch('messenger/fetchMessages');
        }

        onMounted(() => {
            mounted.value = true;
            ps.value = new PerfectScrollbar(container.value, {
                suppressScrollX: true,
            });
            container.value.addEventListener('ps-scroll-y', () => {
                autoScroll.value = ps.value.reach.y === 'end';
            });
        });

        onUnmounted(() => {
            ps.value.destroy();
        });

        store.subscribeAction((action, state) => {
            if (action.type === 'messenger/sendMessage' || action.type === 'messenger/messageReceived') {

                if (ps.value) {
                    ps.value.update();

                    if (autoScroll.value) {
                        scrollToBottom();
                    }
                }

            }
        });


        watch(messages, (newValue, oldValue) => {
            if (ps.value) {
                ps.value.update();
            }

            if (oldValue.length === 0) {
                scrollToBottom();
            }
        });


        return {
            loader,
            fetch,
            lastPage,
            currentPage,
            wrapper,
            container,
            messageGroups,
        }
    }
}
</script>

<style scoped>

</style>
