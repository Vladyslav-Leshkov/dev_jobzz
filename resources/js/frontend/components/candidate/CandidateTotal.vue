<template>
    <span>{{total}}</span>
</template>

<script>
import {computed} from "vue";
import {useStore} from "vuex";

export default {
    name: "CandidateTotal",
    setup(){
        const store = useStore();
        const total = computed(()=> store.state.candidateList.total);
        return {
            total,
        }
    }
}
</script>

<style scoped>

</style>
