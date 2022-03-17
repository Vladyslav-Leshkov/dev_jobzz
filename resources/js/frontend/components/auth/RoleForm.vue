<template>
    <form :action="action" method="POST">
        <slot />
        <div class="row justify-content-around align-items-center pt-80 pb-100">
            <div class="col">
                <button type="submit" name="role" :disabled="!agree" value="candidate" class="btn btn-outline-primary btn-lg rounded-pill w-100">Ищу работу</button>
            </div>
            <div class="col">
                <button type="submit" name="role" :disabled="!agree" value="recruiter" class="btn btn-outline-primary btn-lg rounded-pill w-100">Предлагаю работу</button>
            </div>
        </div>
        <div class="form-check mb-50">
            <input class="form-check-input" type="checkbox" v-model="agree" name="agree" required value="1" id="agree">
            <label class="form-check-label" for="agree">
                Я принимаю <a href="/policy" target="_blank" class="fw-bold">политику конфиденциальности</a>
            </label>
        </div>


    </form>
</template>

<script>
import {ref} from "vue";

export default {
    name: "RoleForm",
    props: {
        action: String
    },
    setup(){
        const agree = ref(false);

        return {
            agree,
        }
    }
}
</script>

<style scoped>

</style>
