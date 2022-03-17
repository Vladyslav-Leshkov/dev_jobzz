import {useStore} from "vuex";
import {computed, ref} from "vue";
import {stripHtml} from "../../../utils/string";

export const useTextMessage = function () {
    const store = useStore();

    const fileInput = ref(null);

    const text = computed({
        get: () => store.state.messenger.messageText,
        set: (value) => store.commit('messenger/SET_MESSAGE_TEXT', value),
    });

    const selectedMessage = computed(() => store.state.messenger.selectedMessage);
    const selectedMessageText = computed(() => selectedMessage ? stripHtml(selectedMessage.value.body).trim() : '');
    const selectedUser = computed(() => store.state.messenger.selectedUser);
    const fileUpload = computed(() => store.state.messenger.fileUpload);

    const onFileChange = () => {
        if (fileInput.value.files.length > 0) {
            const file = fileInput.value.files[0];
            store.commit('messenger/SET_FILE_UPLOAD', {file: file});
        } else {
            store.commit('messenger/SET_FILE_UPLOAD', {file: null});
        }
    }

    const clearFile = () => {
        fileInput.value.value = null;
        store.commit('messenger/SET_FILE_UPLOAD', {file: null});
    }

    const sendMessage = async (e) => {
        if (!e.ctrlKey && !e.shiftKey && !e.altKey && (text.value.length || fileUpload.value !== null)) {
            e.preventDefault();
            if (!selectedMessage.value) {

                const message = {
                    to_id: selectedUser.value.id,
                    body: text.value,
                    file: fileUpload.value,
                    type: 'message',
                };

                text.value = '';
                await store.dispatch('messenger/sendMessage', message);
            } else {
                await store.dispatch('messenger/updateMessage', {
                    id: selectedMessage.value.id,
                    body: text.value,
                });
            }

        }
    }

    const cancelEdit = () => {
        store.dispatch('messenger/cancelEditMessage');
    }

    return {
        sendMessage,
        selectedMessage,
        selectedMessageText,
        text,
        fileInput,
        fileUpload,
        onFileChange,
        clearFile,
        cancelEdit,
    }
}
