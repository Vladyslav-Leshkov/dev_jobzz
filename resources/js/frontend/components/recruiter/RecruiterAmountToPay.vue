<template>
    <a v-cloak v-show="amount > 0" :class="{danger: danger}" :href="href" class="btn-price">
        {{ __('To pay') }} <b>₽{{ amount }}</b>
        <small v-if="before" class="d-block">{{ __('before') }} <b>{{ before }}</b></small>
    </a>
</template>

<script>
import {computed} from "vue";
import {useStore} from "vuex";
import {useI18nLocal} from "../../store/composables/useI18nLocal";

export default {
    name: "RecruiterAmountToPay",
    props: {
        href: {
            type: String,
            default: '#'
        }
    },
    setup(props) {
        const store = useStore();
        const amount = computed(() => store.state.recruiterProfile.amount_to_pay);
        const before = computed(() => store.state.recruiterProfile.pay_before);
        const danger = computed(() => store.state.recruiterProfile.danger);

        store.dispatch('recruiterProfile/getAmountToPay');

        return {
            amount,
            before,
            danger,
        }
    }
}
</script>

<style scoped>

</style>
