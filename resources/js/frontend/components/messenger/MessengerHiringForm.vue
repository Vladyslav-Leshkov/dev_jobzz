<template>
    <div class="msgr-contacts-form">

        <div class="page-title">{{ __('Report hiring') }}</div>
        <hr>
        <div class="mw-420">
            <form-datepicker v-model="released_to_work"
                             class="pb-10 mb-20"
                             date-format="d-m-Y"
                             floating
                             :label="__('Release date')"
                             name="released_to_work"
                             rules="required|date:DD-MM-YYYY"
            />
            <button :disabled="!released_to_work"
                    class="btn btn-info rounded-pill px-35"
                    type="button"
                    @click.prevent="submit()">
                {{ __('I confirm hiring') }}
            </button>
        </div>


    </div>
</template>

<script>
import Calendar from "../common/Calendar";

import SvgIcon from "../svg/SvgIcon";
import FormDatepicker from "../form/FormDatepicker";
import FormSelect from "../form/FormSelect";

import SelectFormGroup from "../form/SelectFormGroup";
import {useHiringMessage} from "./useHiringMessage";

export default {
    name: "MessengerHiringForm",
    components: {SelectFormGroup, FormSelect, FormDatepicker, SvgIcon, Calendar},
    emits: ['close', 'submit'],
    setup(props, {emit}) {

        const {vacancy_id, released_to_work, vacancies} = useHiringMessage();

        const cancel = () => {
            emit('close');
        }

        const submit = () => {
            emit('submit');
        }

        return {
            vacancy_id,
            released_to_work,
            cancel,
            submit,
            vacancies,
        }
    }
}
</script>

<style scoped>

</style>
