<template>
    <div class="row archive-table-row gx-0">
        <div class="col-lg-4">
            <div class="px-20 px-lg-0">
                <span class="row-subtitle black">{{ item.candidate_info.name }}</span>
                <span class="row-title">{{ item.candidate_info.position }}</span>
                <span class="row-subtitle">{{ item.candidate_info.email }}</span>
            </div>

        </div>
        <div class="col-lg-2">
            <div class="px-20">
                <span class="date" v-html="paymentDate"></span>
                <span v-if="item.status === 3" class="date-small">
                    {{ __('Pay before') }}
                    <br>
                    <b>{{ beforeDate }}</b>
                </span>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="px-20">
                <span class="amount">{{ amount }}</span>
                <div>
                    <small :class="{
                        'text-info': item.invoice.status === 0,
                        'text-danger': item.invoice.status === 2,
                        'text-warning': item.invoice.status === 3
                    }"
                           class="status">{{
                            item.invoice.status_text
                        }}</small>
                    <br>
                    <small class="invoice-no">{{ __('Invoice') }} № {{ item.invoice.invoice_no }}</small>
                </div>
            </div>

        </div>
        <div class="col-lg-3">
            <div class="ps-20 pt-5">
                <a v-if="item.invoice.invoice" :href="item.invoice.invoice" class="badge badge-success me-15"
                   target="_blank">
                    {{ __('Invoice') }}
                    <svg-icon icon="download-g"></svg-icon>
                </a>

                <a v-if="item.act" :href=" '/profile/payment/invoice/'+item.id+'/download-act'"
                   class="badge badge-primary" target="_blank">
                    {{ __('Act') }}
                    <svg-icon icon="download-b"></svg-icon>
                </a>
            </div>

        </div>
    </div>
</template>

<script>
import moment from "moment";
import {toAmount} from "../../../utils/number";
import {useI18nLocal} from "../../store/composables/useI18nLocal";


export default {
    name: "CandidateArchiveRow",
    props: {
        item: Object,
    },

    setup(props) {
        const paymentDate = props.item.invoice.paid_at ? moment(props.item.paid_at).format('DD MMMM<br>YYYY') : '';
        const beforeDate = props.item.pay_before ? moment(props.item.pay_before).format('DD MMMM YYYY') : '';
        const amount = '₽ ' + toAmount(props.item.amount);

        return {
            beforeDate,
            paymentDate,
            amount,
        }
    }
}
</script>

<style scoped>

</style>
