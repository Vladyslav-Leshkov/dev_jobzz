<template>
    <a :href="'/admin/messenger?user_id='+fromUser.id" class="list-group-item">
        <div class="row g-0 align-items-center">
            <div class="col-2">
                <img :src="fromUser.avatar_url" class="avatar img-fluid rounded-circle" :alt="fromUser.name">
            </div>
            <div class="col-10 pl-2">
                <div class="text-dark">{{fromUser.name}}</div>
                <div class="text-muted small mt-1" v-html="message.short"></div>
                <div class="text-muted small mt-1">{{message.time}}</div>
            </div>
        </div>
    </a>
</template>

<script>
import {computed} from "vue";

export default {
    name: "NavMessageItem",
    props: {
        message: Object
    },
    setup(props){
        const fromUser = computed(()=>{
            return props.message.from_user || {
                avatar_url: '/images/no-avatar.svg',
                name: 'Anonymous',
            }
        });

        return{
            fromUser
        }
    }
}
</script>

<style scoped>

</style>
