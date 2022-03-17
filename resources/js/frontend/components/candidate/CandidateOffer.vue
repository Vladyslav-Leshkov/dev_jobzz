<template>
    <form :action="action" class="candidate-offer mw-840 mb-70" method="POST" @submit.prevent="onSubmit()">
        <slot/>
        <div class="profile-title mb-25">{{ __('Select and offer a vacancy') }}</div>
        <div class="candidate-offer-vacancies mb-35">
            <div v-for="vacancy in vacancies" :key="'vac-'+vacancy.id" class="form-check form-radio mb-15">
                <input :id="'vac-'+vacancy.id"
                       v-model="vacancyId"
                       :disabled="sent.indexOf(vacancy.id) !== -1"
                       :value="vacancy.id"
                       class="form-check-input"
                       name="vacancy_id"
                       type="radio"
                >
                <label :for="'vac-'+vacancy.id" class="form-check-label text-primary">{{ vacancy.title }} <span
                    v-if="sent.indexOf(vacancy.id) !== -1">({{ __('sent') }})</span></label>
            </div>
        </div>
        <div v-if="vacancies.length > 0">
            <div class="mw-760">
                <div class="candidate-offer-control">
                    <textarea-form-group v-model="comment"
                                         :form-text="__('You can send the standard text to the candidate or edit it.')"
                                         :label="__('Transmittal letter')"
                                         name="comment"
                                         rows="4"
                                         rules="required"
                                         auto-height
                    >
                        <div class="candidate-offer-regards" v-html="regardsText"></div>
                    </textarea-form-group>
                </div>

            </div>

            <div class="d-flex justify-content-end">
                <button :disabled="vacancyId === 0 || !comment || loader || submitted"
                        class="btn rounded-pill btn-lg btn-primary"
                        type="submit"
                >
                    <span>Отправить</span>
                    <svg-icon class="ms-60" icon="arrow-right" size="15"/>
                </button>
            </div>
        </div>
        <div v-if="!submitted && vacancies.length === 0" class="d-flex flex-column py-30">
            <div class="mb-30 text-center">{{ __('You have no vacancies to propose to a candidate.') }}</div>
            <a class="btn rounded-pill btn-lg btn-primary m-auto px-40" href="/profile/vacancy/create">
                {{ __('Create vacancy') }}
            </a>
        </div>
        <!--        <div v-if="submitted">-->
        <!--            <div class="text-center page-subtitle">{{ __('Offer sent') }}</div>-->
        <!--        </div>-->
    </form>
</template>

<script>
import {computed, ref} from "vue";
import TextareaFormGroup from "../form/TextareaFormGroup";
import SvgIcon from "../svg/SvgIcon";
import {axiosPost} from "../../services/api";

export default {
    name: "CandidateOffer",
    components: {SvgIcon, TextareaFormGroup},
    props: {
        action: String,
        vacancies: Array,
        alreadySent: Array,
        comment: String,

    },
    setup(props) {
        const vacancyId = ref(0);
        const comment = ref(props.comment);
        const loader = ref(false);
        const submitted = ref(false);
        const resume = ref(null);
        const sent = ref(props.alreadySent || []);

        const onSubmit = async () => {
            loader.value = true;
            const response = await axiosPost(props.action, {
                vacancy_id: vacancyId.value,
                comment: comment.value,
            });
            if (response) {
                if (response.result === 'success') {
                    toast.success(response.message);
                    sent.value.push(response.offer.vacancy_id)
                    submitted.value = true;
                }
                if (response.result === 'error') {
                    toast.error(response.message);
                }
            }

            loader.value = false
        }

        const regardsText = computed(() => {
            const vacancy = props.vacancies.find(v => v.id === vacancyId.value);
            return (vacancy ? '<a href="' + vacancy.url + '" target="_blank">' + vacancy.title + '</a>' : '');
        });

        return {
            vacancyId,
            comment,
            resume,
            loader,
            submitted,
            sent,
            onSubmit,
            regardsText,
        }
    }
}
</script>

<style scoped>

</style>
