import {useStore} from "vuex";
import {computed, ref} from "vue";
import {trans} from "../../i18n/lang";

export const useContactsMessage = function () {
    const store = useStore();
    const showContacts = ref(false);
    const selectedUser = computed(() => store.state.messenger.selectedUser);
    const fieldsContacts = computed(() => store.state.messenger.fieldsContacts);
    const fileUpload = computed(() => store.state.messenger.fileUpload);
    const isValidContacts = computed(() => {
        return !!fieldsContacts.value.email && (!!fileUpload.value || !!fieldsContacts.value.resume);
    });

    const sendContacts = async () => {
        if (isValidContacts.value) {
            showContacts.value = false;
            const message = {
                to_id: selectedUser.value.id,
                body: `
<div class="fs-italic text-muted mb-10" >
<span class="text-success">Открыл(а) резюме</span> для <b class="text-black">${selectedUser.value.name}</b>
</div>`,
                file: fileUpload.value,
                type: 'profile',
                data: fieldsContacts.value,
            };

            await store.dispatch('messenger/sendMessage', message);
        } else {
            toast.error(trans('Attach resume!'));
        }

    }

    return {

        showContacts,
        sendContacts,
    }
}
