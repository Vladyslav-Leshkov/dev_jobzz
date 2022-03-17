<template>
    <div class="row archive-table-row align-items-center gx-0">
        <div class="col-auto">
            <img class="row-avatar" :src="item.candidate_info.avatar_url" />
        </div>
        <div class="col">
            <div class="ps-20">
                <div class="row-title mb-0">{{item.candidate_info.name}}</div>
                <div class="row-subtitle">{{item.candidate_info.email}}</div>
            </div>
        </div>
        <div class="col-auto">
            <input type="hidden" name="items[]" :value="item.id">
            <div class="ps-20">
                <span class="amount text-muted">{{amount}}</span>
            </div>
        </div>
    </div>
</template>

<script>
import moment from "moment";
import {convertCurrency, toAmount} from "../../../utils/number";
import {computed} from "vue";

export default {
    name: "CandidateInvoiceRow",
    props: {
        item: Object,
        currency: Object,
    },

    setup(props){
        const amount = computed(()=>{
            const amount = convertCurrency(props.item.amount, props.currency.course);
            return props.currency.symbol + ' ' + toAmount(amount);
            
        });

        return {
            amount,
        }
    }

}
</script>

<style scoped>

</style>
