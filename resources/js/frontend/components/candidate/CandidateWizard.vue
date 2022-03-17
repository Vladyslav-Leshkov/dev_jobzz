<template>
    <div>
        <div v-show="!preview" class="profile-page">
            <div class="container-lg container-fluid">
                <form-wizard :action="action" :validation-schema="validationSchema" class="mb-100" method="post">
                    <slot/>
                    <h2 class="profile-page__title">{{ __('Create a profile') }}</h2>
                    <form-step>
                        <employment-selector v-model="employment_types"/>
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
                        <specialization-single-selector v-model="specializations"/>
                        <position-selector v-model="position"/>
                        <experience-selector v-model="experience"/>
                        <div class="row align-items-end flex-column flex-xxl-row">
                            <div class="col mb-30 mb-xxl-60">
                                <salary-selector v-model:freelance="price_freelance"
                                                 v-model:full-time="price_full_time"/>
                            </div>
                            <div class="col mb-30 mb-xxl-60 pb-30">
                                <a href="/candidates" target="_blank">{{ __('Look at other candidates') }}</a>
                            </div>
                        </div>

                        <english-level-selector v-model="english_level"/>
                    </form-step>
                    <form-step>

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
                            @change:avatar="onAvatarChange"

                        ></personal-info>

                    </form-step>
                </form-wizard>
            </div>
        </div>
        <candidate-preview v-show="preview" wizard></candidate-preview>
    </div>

</template>

<script>
import FormWizard from "../form/FormWizard";
import FormStep from "../form/FormStep";

import {computed, provide, watch} from 'vue';
import EnglishLevelSelector from "../wizard/EnglishLevelSelector";
import SalarySelector from "../wizard/SalarySelector";
import PositionSelector from "../wizard/PositionSelector";
import ExperienceSelector from "../wizard/ExperienceSelector";
import SpecializationSelector from "../wizard/SpecializationSelector";
import EmploymentSelector from "../wizard/EmploymentSelector";
import {useWizardCandidate} from "../wizard/useWizardOptions";
import PopularSelector from "../wizard/PopularSelector";
import ProfileDescription from "../wizard/ProfileDescription";
import PersonalInfo from "../wizard/PersonalInfo";
import CandidatePreview from "./CandidatePreview";
import {parseQuery, updateQuery} from "../../../utils/url";
import {useStore} from "vuex";
import SpecializationSingleSelector from "../wizard/SpecializationSingleSelector";
import SkillsSelector from "../wizard/SkillsSelector";
import ChipSelector from "../wizard/ChipSelector";
import CheckBtn from "../form/CheckBtn";
import {__} from '../../i18n/lang';

export default {
    name: "CandidateWizard",
    components: {
        CheckBtn,
        ChipSelector,
        SkillsSelector,
        SpecializationSingleSelector,
        CandidatePreview,
        PersonalInfo,
        ProfileDescription,
        PopularSelector,
        FormStep,
        FormWizard,
        EnglishLevelSelector,
        SalarySelector,
        PositionSelector,
        ExperienceSelector,
        SpecializationSelector,
        EmploymentSelector
    },
    props: {
        action: {
            type: String,
        },
        options: {
            type: Object,
        }
    },
    setup(props) {
        const namespace = 'candidateWizard';
        provide("STORE_NAMESPACE", namespace);

        provide("WIZARD_OPTIONS", props.options);

        const store = useStore();
        const candidate = useWizardCandidate(namespace);

        const validationSchema = [
            {
                employment_types: 'required',
                cities: () => {
                    return candidate.cities.value.length > 0 || (candidate.employment_types && candidate.employment_types.value.indexOf(2) !== -1)
                        ? true
                        : __('Please select at least one')
                },
                specializations: 'required',
                position: 'required',
                english_level: 'min_value:1',
            },
            {
                first_name: 'required',
                last_name: 'required',
                linked_in: 'linkedin',
                // description: 'required',
                skills: 'max_count:5',
            }
        ];


        const query = parseQuery();


        if (document.location.pathname === '/profile/preview') {
            store.commit(namespace + '/SET_PREVIEW', true);
        } else {
            store.commit(namespace + '/SET_PREVIEW', false);
            if (!query.step) {
                store.commit(namespace + '/RESET');
                updateQuery(document.location.pathname, {step: 1});
            } else {
                const step = query.step > 0 && query.step < 3 ? query.step - 1 : 0;
                store.commit(namespace + '/SET_STEP', step);
            }
        }

        const currentStep = computed(() => store.getters[namespace + '/currentStep']);

        watch(currentStep, (step) => {
            updateQuery('/profile/wizard', {step: step});
        })

        const notPopularCities = props.options.cities.filter(c => c.popular === 0);
        const popularCities = props.options.cities.filter(c => c.popular === 1);
        return {
            validationSchema,
            popularCities,
            notPopularCities,
            ...candidate,
        }
    }
}

</script>

<style scoped>

</style>
