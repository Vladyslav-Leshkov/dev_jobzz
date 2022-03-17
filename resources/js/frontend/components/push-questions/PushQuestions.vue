<template>
    <div v-show="questions && questions.length > 0" class="push-questions-container">
        <push-question v-for="question in questions" :key="'push-q-'+question.id" :item="question" @close="close"/>
    </div>
</template>

<script>
import {ref} from "vue";
import {axiosGet} from "../../services/api";
import PushQuestion from "./PushQuestion";

export default {
    name: "PushQuestions",
    components: {PushQuestion},
    setup() {
        const questions = ref([]);

        const loadMessages = async () => {
            questions.value = await axiosGet('/api/push-questions');
        }

        const close = (item) => {
            questions.value = questions.value.filter(it => it.id !== item.id);
        }

        loadMessages();

        return {
            questions,
            close,
        }
    }
}
</script>

<style scoped>

</style>
