<template>
    <form :action="action" method="POST">
        <div class="page-title mb-30">{{ __('Payment candidates') }}</div>
        <slot/>
        <div class="payment-table mb-20">
            <div class="row payment-table-header gx-5 d-none d-lg-flex">
                <div class="col-5">
                    <!--                    <div class="form-check">-->
                    <!--                        <input id="select-all" :checked="allSelected" class="form-check-input" type="checkbox"-->
                    <!--                               @change="selectAll">-->
                    <!--                        <label class="form-check-label" for="select-all">{{ __('Select All') }}</label>-->
                    <!--                    </div>-->
                    {{ __('candidate.title') }}
                </div>
                <div class="col-2">{{ __('Release date') }}</div>
                <div class="col-2">{{ __('Pay before') }}</div>
                <div class="col-3">{{ __('Price') }}</div>
            </div>
            <candidate-payment-row v-for="item in items"
                                   :key="'cand-'+item.id"
                                   v-model="selected"
                                   :item="item"
                                   class="mb-8"
            ></candidate-payment-row>

            <div v-if="items.length === 0" class="alert alert-secondary text-center">
                {{ __('No data available') }}
            </div>
        </div>
        <button v-if="items.length > 0" :disabled="selected.length === 0"
                class="btn btn-primary rounded-pill px-55 py-10"
                type="submit"> {{ __('Pay') }}
        </button>
    </form>
</template>

<script>
import Checkbox from "../form/Checkbox";
import {computed, ref} from "vue";
import CandidatePaymentRow from "./CandidatePaymentRow";
import {useI18nLocal} from "../../store/composables/useI18nLocal";

export default {
    name: "CandidatePaymentForm",
    components: {
        CandidatePaymentRow,
        Checkbox
    },
    props: {
        action: String,
        items: Array,
    },
    setup(props) {


        const selected = ref(props.items.map(i => i.id));
        const allSelected = computed(() => {
            return selected.value.length === props.items.length;
        });

        const selectAll = (evt) => {
            if (evt.target.checked) {
                selected.value = props.items.map(i => i.id);
            } else {
                selected.value = [];
            }
        }

        return {
            selectAll,
            selected,
            allSelected,
        }
    }
}
</script>

<style scoped>

</style>
