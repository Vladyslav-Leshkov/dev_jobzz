import {useStore} from "vuex";
import {computed, ref} from "vue";
import moment from "moment";


export const useHiringMessage = function () {
    const store = useStore();
    const showHiring = ref(false);
    const selectedUser = computed(() => store.state.messenger.selectedUser);
    const vacancies = computed(() => store.getters["messenger/vacancies"]);

    const released_to_work = computed({
        get() {
            return store.state.messenger.hiring.released_to_work;
        },
        set(val) {
            store.commit('messenger/SET_HIRING', {released_to_work: val});
        }
    });

    const vacancy_id = computed({
        get() {
            return store.state.messenger.hiring.vacancy_id;
        },
        set(val) {
            store.commit('messenger/SET_HIRING', {vacancy_id: val});
        }
    });

    //const selectedVacancy = computed(() => store.getters['messenger/selectedVacancy']);

    const sendHiring = async () => {

        const date = moment(released_to_work.value, 'DD-MM-YYYY').format('DD.MM.YYYY');
        const message = {
            to_id: selectedUser.value.id,
            body: `
<div class="fs-italic text-muted mb-10" >
<span class="text-success">Сообщил(а) о найме</span>,
дата выхода на работу <b class="text-black">${date}</b>
</div>`,
            type: 'hiring',
            file: null,
            data: {
                released_to_work: released_to_work.value,
                vacancy_id: vacancy_id.value || 0,
            }
        };

        await store.dispatch('messenger/sendMessage', message);
        showHiring.value = false;

    }

    return {
        vacancies,
        released_to_work,
        vacancy_id,
        showHiring,
        sendHiring,
    }
}
