<template>
    <div class="msgr-sender">
        <div class="msgr-sender-status">
            <div>
                <span v-if="fileUpload">
                    {{ fileUpload.name }}
                    <a class="ms-10 text-danger" href="#" @click.prevent="clearFile()">
                        <svg-icon icon="times"></svg-icon>
                    </a>
                </span>
            </div>
            <div>

            </div>
        </div>
        <div class="msgr-sender-data">
            <div v-if="selectedMessage" class="msgr-selected-message">
                <div class="msgr-selected-body" :title="selectedMessageText">{{ selectedMessageText }}</div>
                <a href="#" class="msgr-selected-cancel" @click.prevent="cancelEdit()">
                    <svg-icon icon="times"></svg-icon>
                </a>
            </div>
            <textarea v-if="selectedUser" v-model.trim="text" class="form-control" placeholder="Введите текст"
                      @focus="makeSeen" @keydown.enter="sendMessage"></textarea>
            <messenger-contacts-form
                v-if="!selectedMessage && currentUser.type === 'candidate' && showContacts"
                @close="showContacts = false"
            ></messenger-contacts-form>
            <messenger-resume
                v-if="!selectedMessage &&currentUser.type === 'recruiter' && showContacts"
                @close="showContacts = false"
            ></messenger-resume>
            <messenger-hiring-form
                v-if="!selectedMessage && showHiring"
                @close="showHiring = false"
                @submit="sendHiring()"
            ></messenger-hiring-form>
        </div>


        <div v-if="selectedUser" :class="{'show': !collapsed}" class="msgr-sender-actions mt-25">
            <div>
                <label v-if="!selectedMessage" class="btn btn-round btn-outline-secondary">
                    <input ref="fileInput" accept=".png,.jpg,.zip,.doc,.docx" class="d-none" type="file"
                           @change="onFileChange()">
                    <svg-icon icon="paperclip"></svg-icon>
                </label>
                <div class="msgr-collapse">
                    <button
                        v-if="!selectedMessage && selectedUser.type !== 'support' && currentUser.type === 'recruiter'"
                        :class="{open: showContacts}"
                        :disabled="!selectedUser.profile_opened || loading || showHiring"
                        class="btn btn-outline-primary btn-resume ms-15"
                        @click.prevent="showContacts = !showContacts"
                    >{{ showContacts ? __('Hide resume') : __('Show resume') }}
                        <svg-icon icon="chevron-up"/>
                    </button>


                    <button
                        v-if="!selectedMessage && selectedUser.type !== 'support' && currentUser.type === 'candidate' && !showContacts"
                        :disabled="loading || showHiring"
                        class="btn btn-outline-primary ms-15"
                        @click.prevent="showContacts = true"
                    >
                        {{ __('Open your contacts') }}
                    </button>

                    <button
                        v-if="!selectedMessage && selectedUser.type !== 'support' && currentUser.type === 'candidate' && showContacts"
                        :disabled="loading || showHiring"
                        class="btn btn-outline-primary ms-15"
                        @click.prevent="sendContacts()"
                    >
                        {{ __('Send your contacts') }}
                    </button>

                    <button v-if="!selectedMessage && currentUser.type !== 'admin' && selectedUser.type !== 'support'"
                            :class="{active: showHiring}"
                            :disabled="loading || showContacts"
                            class="btn btn-primary ms-15"
                            @click.prevent=" showHiring = !showHiring"
                    >
                        {{ __('Report hiring') }}
                    </button>

                </div>
            </div>
            <div>
                <button v-if="selectedUser.type === 'support' || currentUser.type !== 'candidate' || !showContacts"
                        :disabled="showContacts || showHiring || loading"
                        class="btn btn-primary ms-15 btn-send collapsed-hide"
                        @click.prevent="sendMessage"
                >
                    {{ __('Send') }}
                </button>

                <button
                    v-if="!selectedMessage && selectedUser.type !== 'support' && currentUser.type === 'candidate' && showContacts"
                    :disabled="loading || showHiring"
                    class="btn btn-primary ms-15 btn-send collapsed-hide"
                    @click.prevent="sendContacts()"
                >
                    {{ __('Send') }}
                </button>

                <a :class="{active: !collapsed}"
                   class="msgr-sender-menu ms-30 d-md-none"
                   href="#"
                   @click.prevent="collapsed = !collapsed"
                >
                    <i></i><i></i><i></i>
                </a>
            </div>


        </div>
    </div>
</template>

<script>
import {useStore} from "vuex";
import {computed, onMounted, ref, watch} from "vue";
import SvgIcon from "../svg/SvgIcon";
import MessengerContactsForm from "./MessengerContactsForm";
import MessengerResume from "./MessengerResume";
import MessengerHiringForm from "./MessengerHiringForm";
import {useHiringMessage} from "./useHiringMessage";
import {useContactsMessage} from "./useContactsMessage";
import {useTextMessage} from "./useTextMessage";

export default {
    name: "MessengerMessageSender",
    components: {MessengerHiringForm, MessengerResume, MessengerContactsForm, SvgIcon},
    setup() {
        const store = useStore();
        const collapsed = ref(true);
        const currentUser = computed(() => store.state.messenger.currentUser)
        const selectedUser = computed(() => store.state.messenger.selectedUser)


        const loading = computed(() => store.state.messenger.loading_messages || store.state.messenger.loading_contacts);

        const makeSeen = async () => await store.dispatch('messenger/seen');


        return {
            currentUser,
            selectedUser,
            loading,
            collapsed,
            makeSeen,
            ...useHiringMessage(),
            ...useContactsMessage(),
            ...useTextMessage(),
        }
    }
}
</script>

<style scoped>

</style>
