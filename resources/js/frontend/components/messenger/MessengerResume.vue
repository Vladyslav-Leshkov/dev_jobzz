<template>
    <div class="msgr-contacts-form">
        <a class="close" href="#" @click.prevent="close()">
            <svg-icon icon="chevron-down" size="24"/>
        </a>
        <div class="page-title mb-10">{{ selectedUser.name }}</div>
        <div class="text-light fw-500 font-12" v-html="selectedUser.position"></div>
        <hr>
        <div v-html="resume"></div>
        <spinner v-if="loader"></spinner>
    </div>
</template>

<script>
import {computed, onMounted, ref} from "vue";
import {useStore} from "vuex";
import {axiosGet} from "../../services/api";
import SvgIcon from "../svg/SvgIcon";
import Spinner from "../common/Spinner";

export default {
    name: "MessengerResume",
    components: {Spinner, SvgIcon},
    emits: ['close'],
    setup(props, {emit}) {
        const store = useStore();
        const loader = ref(false);
        const resume = ref('');

        const selectedUser = computed(() => store.state.messenger.selectedUser);

        const loadResume = async () => {
            loader.value = true;
            const result = await axiosGet(`/messenger/${selectedUser.value.id}/resume`);
            if (result) {
                resume.value = result;
            }
            loader.value = false;
        }

        const close = () => {
            emit('close');
        }

        onMounted(() => {
            loadResume();
        });

        return {
            close,
            loader,
            resume,
            selectedUser,
        }
    }
}
</script>

<style scoped>

</style>
