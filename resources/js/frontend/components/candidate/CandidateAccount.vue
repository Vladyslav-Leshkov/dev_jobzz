<template>
    <div>
        <div v-show="!preview">
            <div class="page-header mb-30 mb-lg-50 pb-xl-25">
                <div class="container-fluid container-lg">
                    <div class="page-header-body">
                        <!--                        <h1 class="page-header-title mb-5"><span>{{ __('My account') }}</span></h1>-->
                        <div v-if="status === 1" class="page-header-action">
                            <span>{{ __('Profile is active') }}</span>
                            <a href="#" @click.prevent="askModal()">{{ __('Switch off') }}</a>
                        </div>
                        <div v-if="status === 2" class="page-header-action">
                            <span class="text-danger">{{ __('Profile is inactive') }}</span>
                            <a href="#" @click.prevent="toggleStatus(1)">{{ __('Switch on') }}</a>
                        </div>
                        <div v-if="status === 3" class="page-header-action">
                            <span class="text-danger">{{ __('Profile locked') }}</span>
                        </div>
                        <div v-if="status === 4" class="page-header-action">
                            <span class="text-warning">{{ __('Profile on moderation') }}</span>
                        </div>
                        <div v-if="status === 5" class="page-header-action">
                            <span class="text-danger">{{ __('Profile deleted') }}</span>
                        </div>
                    </div>
                </div>
            </div>

            <form :action="action" enctype="multipart/form-data" method="post" @submit="onSubmit">
                <div class="container-fluid container-lg mb-80">
                    <slot/>
                    <specialization-single-selector v-model="specializations"/>
                    <position-selector v-model="position"/>
                    <experience-selector v-model="experience"/>

                    <english-level-selector v-model="english_level"/>
                    <employment-selector v-model="employment_types"/>
                    <div class="row align-items-end flex-column flex-xxl-row">
                        <div class="col mb-30 mb-xxl-60">
                            <salary-selector v-model:freelance="price_freelance" v-model:full-time="price_full_time"/>
                        </div>
                        <div class="col mb-30 mb-xxl-60 pb-30">
                            <a href="/candidates" target="_blank">{{ __('Look at other candidates') }}</a>
                        </div>
                    </div>

                    <chip-selector key="cities-selector"
                                   id="cities_section"
                                   v-model="cities"
                                   :options="notPopularCities"
                                   name="cities"
                                   :placeholder="__('Enter the name of the city')"
                                   :title="__('Cities in which you are considering a job')"
                    >

                        <check-btn v-for="option in popularCities"
                                   :key="'city-'+option.id"
                                   v-model="cities"
                                   :validation="false"
                                   :value="option.id"
                                   class="mb-8 me-8"
                                   name="cities"
                        >{{ option.title }}
                        </check-btn>
                        <check-btn v-model="employment_types" :value="2" class="mb-8 me-8"
                                   name="employment_types">{{ __('Remotely') }}
                        </check-btn>
                    </chip-selector>

                    <skills-selector key="skills-selector"
                                     v-model="skills"
                                     :error-title="__('Choose no more than 5 skills')"
                                     name="skills"
                                     placeholder=" "
                                     :subtitle="__('no more than 5 skills, not necessary, but this will help speed up the job search process')"
                                     :subtitle-popular="__('Popular')"
                                     :title="__('Select basic skills')"
                    ></skills-selector>
                    <skills-selector key="additional-skills-selector"
                                     v-model="additional_skills"
                                     name="additional_skills"
                                     placeholder=" "
                                     :subtitle-popular="__('Popular')"
                                     :title="__('The skills you own')"
                    ></skills-selector>

                    <profile-description v-model="description"></profile-description>

                    <personal-info
                        v-model:first-name="first_name"
                        v-model:last-name="last_name"
                        v-model:linked-in="linked_in"
                        :avatar="avatar"
                        :resume="resume"
                        @change:avatar="onAvatarChange"
                        @change:resume="onResumeChange"

                    ></personal-info>


                    <div class="row justify-content-between wizard-btns-row">
                        <div class="col-12 col-lg-auto mb-lg-20">
                            <button :value="status"
                                    class="btn btn-lg btn-outline-primary px-lg-40 me-35 mb-20 rounded-pill"
                                    name="publish"
                                    type="submit">
                                <span>{{ __('Save') }}</span>
                            </button>
                            <button v-if="status === 2" class="btn btn-lg btn-primary me-15 rounded-pill  mb-20"
                                    name="publish"
                                    type="submit"
                                    value="1">
                                <span>{{ __('Save and publish') }}</span>
                                <svg-icon class="ms-15" icon="arrow-right" size="15"/>
                            </button>
                            <a class="btn btn-lg btn-link btn-preview  mb-lg-20" href="#"
                               @click.prevent="showPreview()">
                                <svg-icon class="me-5" icon="eye" size="25"/>
                                <span>{{ __('Preview') }}</span></a>
                        </div>
                        <div class="col-12 col-lg-auto">
                            <a class="btn btn-lg btn-outline-danger px-lg-40 me-35 rounded-pill  mb-20"
                               href="/profile/delete">
                                <span>{{ __('Delete Account') }}</span>
                            </a>
                        </div>
                    </div>

                </div>


            </form>
        </div>
        <candidate-preview v-if="preview"></candidate-preview>
        <bs-modal :close-btn="false" :opened="modalOpened" @bs-hide="modalOpened = false">
            <div class="modal-body">
                <div class="font-18 text-center fw-600 mb-20">{{ __('Did our resource help you find a job?') }}</div>
                <a :href="`/recruiter/confirm`"
                   class="btn btn-primary d-block w-100 mb-20">{{ __('Yes, I found a job at') }} Jobzz.ru</a>
                <button class="btn btn-outline-secondary w-100 d-block"
                        @click.prevent="answerNo()">{{ __('No, didn\'t help') }}
                </button>
            </div>
        </bs-modal>
    </div>
</template>

<script>
import SpecializationSelector from "../wizard/SpecializationSelector";

import {useWizardCandidate,} from "../wizard/useWizardOptions";

import {onMounted, provide, ref} from "vue";
import {useStore} from "vuex";
import PositionSelector from "../wizard/PositionSelector";
import ExperienceSelector from "../wizard/ExperienceSelector";
import SalarySelector from "../wizard/SalarySelector";
import EnglishLevelSelector from "../wizard/EnglishLevelSelector";
import EmploymentSelector from "../wizard/EmploymentSelector";
import ChipSelector from "../wizard/ChipSelector";
import ProfileDescription from "../wizard/ProfileDescription";
import PersonalInfo from "../wizard/PersonalInfo";
import SvgIcon from "../svg/SvgIcon";
import {axiosPatch} from "../../services/api";
import {useForm} from "vee-validate";
import CandidatePreview from "./CandidatePreview";
import SpecializationSingleSelector from "../wizard/SpecializationSingleSelector";
import * as URLUtils from "../../../utils/url";
import SkillsSelector from "../wizard/SkillsSelector";
import {scrollToError} from "../wizard/useWizardErrors";
import {scrollTo} from "../../../utils/functions";
import BsModal from "../bootstrap/BsModal";
import CheckBtn from "../form/CheckBtn";
import {__} from "../../i18n/lang";

export default {
    name: "CandidateAccount",
    components: {
        CheckBtn,
        BsModal,
        SkillsSelector,
        SpecializationSingleSelector,
        CandidatePreview,
        SvgIcon,
        PersonalInfo,
        ProfileDescription,
        ChipSelector,
        EmploymentSelector,
        EnglishLevelSelector,
        SalarySelector,
        ExperienceSelector,
        PositionSelector,
        SpecializationSelector
    },
    props: {
        action: String,
        user: Object,
        profile: {
            type: Object,
            default() {
                return {}
            }
        },
        options: Object,
    },
    setup({options, user, profile}) {

        const namespace = 'candidateWizard';

        provide("WIZARD_OPTIONS", options);
        provide("STORE_NAMESPACE", namespace);
        const candidate = useWizardCandidate(namespace);

        const {submitForm, validate, errors} = useForm({
            validationSchema: {
                employment_types: 'required',
                cities: () => {
                    return candidate.cities.value.length > 0 || (candidate.employment_types && candidate.employment_types.value.indexOf(2) !== -1)
                        ? true
                        : __('Please select at least one')
                },
                specializations: 'required',
                position: 'required',
                english_level: 'min_value:1',
                first_name: 'required',
                last_name: 'required',
                linked_in: 'linkedin',
                //description: 'required',
                skills: 'max_count:5',
            },
        });


        const status = ref(profile ? profile.status : 0);

        const store = useStore();


        store.commit(namespace + '/UPDATE_FORM_DATA', {
            specializations: profile ? profile.specializations.map(s => s.id) : [],
            cities: profile ? profile.cities.map(s => s.id) : [],
            employmentTypes: profile ? profile.employment_types.map(s => s.id) : [],
            skills: profile ? profile.skills.map(s => s.title) : [],
            additional_skills: profile ? profile.additional_skills.map(s => s.title) : [],
            position: profile ? profile.position : '',
            experience: profile ? profile.experience : 0,
            price_full_time: profile ? profile.price_full_time : 10000,
            price_freelance: profile ? profile.price_freelance : 1000,
            english_level: profile ? profile.english_level : 0,
            description: profile ? profile.description : '',
            resume: profile ? profile.resume_name : '',
            resume_upload: null,
            first_name: user.first_name,
            last_name: user.last_name,
            linked_in: user.linked_in,
            avatar: user.avatar_url,
            avatar_upload: null,
            preview: false
        });


        candidate.preview.value = document.location.pathname === '/profile/preview';

        const toggleStatus = async (newStatus) => {
            const response = await axiosPatch('/profile/change-status/' + newStatus);
            if (response.result === 'success') {
                toast.success(response.message);
                status.value = newStatus;
            }
        }

        const onSubmit = async (event) => {
            const result = await validate();
            if (result.valid) {
                await submitForm();
            } else {
                event.preventDefault();
                scrollToError(errors.value);
            }
        }

        const showPreview = () => {
            URLUtils.updateQuery('/profile/preview')
            candidate.preview.value = true
            scrollTo('.header', 88);
        }

        const modalOpened = ref(false);

        const askModal = async () => {
            modalOpened.value = true;
        }

        const answerNo = async () => {
            await toggleStatus(2);
            modalOpened.value = false;
        }

        const notPopularCities = options.cities.filter(c => c.popular === 0);
        const popularCities = options.cities.filter(c => c.popular === 1);

        return {
            ...candidate,
            status,
            modalOpened,
            askModal,
            answerNo,
            toggleStatus,
            showPreview,
            onSubmit,
            notPopularCities,
            popularCities,
            ...candidate,
        }
    }
}
</script>

<style scoped>

</style>
