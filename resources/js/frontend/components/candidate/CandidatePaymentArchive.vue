<template>
    <div>
        <div class="page-title mb-30">{{ __('Payment archive') }}</div>
        <div class="archive-table mb-20">
            <candidate-archive-row
                v-for="item in items"
                :key="'cand-arch-'+item.id"
                :item="item"
            ></candidate-archive-row>
            <div v-if="items.length === 0" class="alert alert-secondary text-center">
                {{ __('No data available') }}
            </div>
        </div>
    </div>
</template>

<script>
import CandidateArchiveRow from "./CandidateArchiveRow";
import {useI18nLocal} from "../../store/composables/useI18nLocal";

export default {
    name: "CandidatePaymentArchive",
    components: {CandidateArchiveRow},
    props: {
        items: Array,
    },
    setup() {
      
    }
}
</script>

<style scoped>

</style>
