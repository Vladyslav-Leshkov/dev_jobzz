<template>
    <div class="hiring-btn">
        <div v-if="!confirmed">
            <a href="#" @click.prevent="showCalendar = !showCalendar"
               class="btn btn-primary rounded-pill px-30 py-7"
               :class="{active: showCalendar, disabled: request}"
            >{{ __('Confirm hiring') }}
                <svg-icon icon="arrow-right" class="ms-15"/>
            </a>
            <div class="hiring-confirm"  v-if="showCalendar">
                <div class="hiring-confirm-head">
                    {{ __('Released to work') }}
                </div>
                <calendar class="hiring-confirm-calendar"

                          v-model="date"
                          :max-date="maxDate"
                          :min-date="minDate"
                ></calendar>
                <div class="hiring-confirm-btns"  v-if="date">
                    <a class="hiring-confirm-btn" href="#" @click.prevent="confirm()">
                        ОК
                    </a>
                    <a class="hiring-confirm-btn" href="#" @click.prevent="cancel()">
                        {{ __('Cancel') }}
                    </a>
                </div>

            </div>
        </div>
        <div v-if="confirmed" class="btn btn-outline-primary disabled rounded-pill fw-600 px-30 py-7">
            {{ fromCandidate ? __('Hiring confirmed') : __('Candidate hired') }}
        </div>
    </div>
</template>

<script>
import SvgIcon from "../svg/SvgIcon";

import {reactive, ref} from "vue";
import moment from "moment";
import Calendar from "../common/Calendar";
import {axiosPost} from "../../services/api";
import {useStore} from "vuex";

export default {
    name: "VacancyHiringBtn",
    components: {
        Calendar,
        SvgIcon,

    },
    props: {
        offer: Object,
        fromCandidate: Boolean,
    },
    setup({offer, fromCandidate}){
        const store = useStore();
        const date = ref('');
        const minDate = ref(moment().format());
        const maxDate = ref(moment().add(3, 'M').format());
        const showCalendar = ref(false);
        const request = ref(false);
        const confirmed = ref(offer.confirmed);

        const confirm = async ()=>{
            showCalendar.value = false;
            request.value = true;
            const url = fromCandidate ? `/vacancies/${offer.id}/confirm` : `/profile/vacancy/${offer.id}/confirm`;
            const response = await axiosPost(url, {
                released_to_work: date.value
            });
            toast.show({message: response.message, delay: 10000, type: response.result});
            if(response.result === 'success'){
                confirmed.value = true;
                if(!fromCandidate){
                    await store.dispatch('recruiterProfile/getAmountToPay');
                }
            }
            request.value = false;
        }

        const cancel = ()=>{
            date.value = '';
            showCalendar.value = false;
        }
        return {
            date,
            minDate,
            maxDate,
            showCalendar,
            request,
            confirm,
            confirmed,
            cancel,
        }
    }
}
</script>

<style scoped>

</style>
