<template>
    <div class="row payment-table-row gx-5">
        <div
            class="col-lg-5 d-flex flex-lg-row-reverse justify-content-between justify-content-lg-end align-items-lg-center">

            <label class="me-5" :for="'cand-'+item.id">
                <span class="row-subtitle black">{{ item.candidate_info.name }}</span>
                <span class="row-title">{{ item.candidate_info.position }}</span>
                <span class="row-subtitle">{{ item.candidate_info.email }}</span>
            </label>
            <div class="form-check form-radio">
                <input :id="'cand-'+item.id" v-model="selected" :value="item.id" class="form-check-input" name="items[]"
                       type="radio">
                <label :for="'cand-'+item.id" class="form-check-label"></label>
            </div>
        </div>
        <div class="col-lg-2">
            <div class="d-lg-none fw-bold">{{ __('Release date') }}</div>
            <span class="date" v-html="releasedDate"></span>
        </div>
        <div class="col-lg-2">
            <div class="d-lg-none fw-bold">{{ __('Pay before') }}</div>
            <span class="date" v-html="payBefore"></span>
        </div>
        <div class="col-lg-3">
            <div class="d-lg-none fw-bold">{{ __('Price') }}</div>
            <span class="amount">{{ amount }}</span>
        </div>
    </div>
</template>

<script>
import moment from "moment";

import {useVModel} from "../../../composables/useVModel";
import {useI18nLocal} from "../../store/composables/useI18nLocal";

export default {
    name: "CandidatePaymentRow",

    props: {
        item: Object,
        modelValue: [Array, Number],
    },
    emits: ['update:modelValue'],
    setup(props) {

        const selected = useVModel(props);
        const releasedDate = moment(props.item.released_to_work).format('DD MMMM<br>YYYY');
        const payBefore = moment(props.item.pay_before).format('DD MMMM<br>YYYY');
        const amount = '₽ ' + props.item.amount;

        return {
            selected,
            releasedDate,
            payBefore,
            amount,
        }
    }
}
</script>

<style scoped>

</style>
