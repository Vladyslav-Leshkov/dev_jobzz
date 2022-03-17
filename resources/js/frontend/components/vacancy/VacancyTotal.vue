<template>
    <span>{{total}}</span>
</template>

<script>
import {useStore} from "vuex";
import {computed} from "vue";

export default {
    name: "VacancyTotal",
    setup(){
        const store = useStore();
        const total = computed(()=> store.state.vacancyList.total);
        return {
            total,
        }
    }
}
</script>

<style scoped>

</style>
