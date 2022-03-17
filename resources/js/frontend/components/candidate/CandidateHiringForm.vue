<template>
    <div class="card p-30">
        <h5 class="header-vacancies__title pb-2">{{ __('Report hiring') }}</h5>
        <div class="payment__subtitle p-b-43">{{ __('Hired a candidate? Tell us please') }}</div>
        <div class="payment__block-input d-flex flex-md-row flex-xl-column">
            <text-form-group :label="__('Candidate Email')"
                             name="email"
                             v-model="email"
                             rules="required|email"
                             floating
                             class="pb-10"
            />
            <form-datepicker :label="__('Released to work')"
                             v-model="released_to_work"
                             name="released_to_work"
                             rules="required|date:DD-MM-YYYY"
                             date-format="d-m-Y"
                             floating
                             class="pb-10 mb-20"
            />
        </div>
        <div class="payment__btn mb-20">
            <button :disabled="request" type="button" class="btn rounded-pill btn-lg btn-info w-100 d-flex justify-content-between" @click.prevent="onSubmit()">
                <span>{{ __('Report hiring') }}</span>
                <svg-icon icon="arrow-right" ></svg-icon>
            </button>
        </div>
    </div>
</template>

<script>
import FormDatepicker from "../form/FormDatepicker";
import TextFormGroup from "../form/TextFormGroup";
import {ref} from "vue";
import {useForm} from "vee-validate";
import {axiosPost} from "../../services/api";
import SvgIcon from "../svg/SvgIcon";
export default {
    name: "CandidateHiringForm",
    components: {
        SvgIcon,
        TextFormGroup,
        FormDatepicker
    },
    setup(props){
        const request = ref(false);
        const email = ref('');
        const released_to_work = ref('');

        const { validate } = useForm({
            validationSchema: {
                email: 'required|email',
                released_to_work: 'required|date:DD-MM-YYYY',
            },
        });

        const onSubmit = async () => {
            const {valid} = await validate();
            if(valid){
                request.value = true;
                const data = await axiosPost('/api/recruiter/report-hiring', {
                    email: email.value,
                    released_to_work: released_to_work.value,
                });
                toast.show(data);
                if(data.result === 'success'){
                    email.value = '';
                    released_to_work.value = '';
                }
                request.value = false;
            }
        }

        return{
            request,
            email,
            released_to_work,
            onSubmit,
        }
    }
}
</script>

<style scoped>

</style>
