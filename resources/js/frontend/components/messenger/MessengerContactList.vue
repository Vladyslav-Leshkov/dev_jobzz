<template>
    <div class="msgr-contact-list" ref="container">
        <div class="msgr-contacts-wrapper">
            <messenger-support-item v-if="currentUser.type !== 'admin' && currentUser.type !== 'support'"/>
            <messenger-contact-item
                v-for="user in contacts"
                :key="'msgr-ct-'+user.id"
                :user="user"
            />
            <spinner v-if="loader" class="py-20"></spinner>
        </div>
    </div>
</template>

<script>
import {useStore} from "vuex";
import {computed, onMounted, ref} from "vue";
import MessengerContactItem from "./MessengerContactItem";
import MessengerSupportItem from "./MessengerSupportItem";
import Spinner from "../common/Spinner";
import PerfectScrollbar from "perfect-scrollbar";

export default {
    name: "MessengerContactList",
    components: {Spinner, MessengerSupportItem, MessengerContactItem},
    setup() {
        const store = useStore();
        const container = ref(null);
        const ps = ref(null);
        const currentUser = computed(() => store.state.messenger.currentUser);
        const contacts = computed(() => store.getters['messenger/filteredContacts']);
        const loader = computed(() => store.state.messenger.loading_contacts);

        store.subscribeAction((action, state) => {
            //
            if (action.type === 'messenger/fetchContacts') {
                if (ps.value) {
                    container.value.scrollTop = 0;
                    ps.value.update();
                }

            }
        });

        onMounted(() => {


            ps.value = new PerfectScrollbar(container.value, {
                suppressScrollX: true,
            });

            container.value.addEventListener('ps-y-reach-end', (evt) => {
                store.dispatch('messenger/moreContacts');
            });


        });
        return {
            container,
            contacts,
            loader,
            currentUser,
        }
    }
}
</script>

<style scoped>

</style>
