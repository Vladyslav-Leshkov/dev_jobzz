<template>
    <div>
        <div class="page-header mb-30 mb-lg-50 pb-25">
            <div class="container-fluid container-lg">
                <div class="page-header-body">
                    <!--                    <h1 class="page-header-title mb-5"><span>{{ __('Profile preview') }}</span></h1>-->
                    <div class="page-header-action">
                        <a href="#" @click.prevent="cancel()">{{ __('Back to editing') }}</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid container-lg mb-80">
            <div class="row">
                <div class="col-12 col-xl-10 offset-xl-2">
                    <div class="publish-date">{{ __('Date of publication') }} 28.06.2024</div>
                    <div class="profile-title">{{ position }}</div>
                    <div class="profile-activity">{{ __('Activity') }}: <strong>{{ __('just now') }}</strong></div>
                    <div class="profile-meta mb-15">
                        <div class="meta-item">
                            <div class="meta-title">{{ __('An experience') }}</div>
                            <div class="meta-value" v-html="experience_title"></div>
                        </div>
                        <div class="meta-item">
                            <div class="meta-title">{{ __('English level') }}</div>
                            <div class="meta-value" v-html="english_title"></div>
                        </div>
                        <div class="meta-item text-success" v-if="price_title">
                            <div class="meta-title">{{ __('The salary') }}</div>
                            <div class="meta-value" v-html="price_title"></div>
                        </div>
                        <div class="meta-item">
                            <div class="meta-title">{{ __('Location') }}</div>
                            <div class="meta-value" v-html="location_title"></div>
                        </div>
                    </div>
                    <hr class="mw-1200">
                    <div v-if="employment_types && employment_types.length" class="mb-20">
                        <div class="profile-subtitle">{{ __('Work options considered') }}</div>
                        <div class="profile-badges">
                            <div v-for="et_id in employment_types"
                                 :key="'et-'+et_id"
                                 class="badge rounded-pill bg-primary badge-xl me-10"
                            >{{ optionTitle('employment_types', et_id) }}
                            </div>
                        </div>
                    </div>
                    <div v-if="skills && skills.length" class="mb-40">
                        <div class="profile-subtitle">{{ __('Basic skills') }}</div>
                        <div class="profile-badges">
                            <div v-for="skill_id in skills"
                                 :key="'skill-'+skill_id"
                                 class="badge rounded-pill bg-white badge-xl me-10"
                            >{{ optionTitle('skills', skill_id) }}
                            </div>
                        </div>
                    </div>
                    <div v-if="additional_skills && additional_skills.length" class="mb-40">
                        <div class="profile-subtitle">{{ __('Skills') }}</div>
                        <div class="profile-badges">
                            <div v-for="skill_id in additional_skills"
                                 :key="'skill-'+skill_id"
                                 class="badge rounded-pill bg-white badge-xl me-10"
                            >{{ optionTitle('skills', skill_id) }}
                            </div>
                        </div>
                    </div>
                    <div v-if="description" class="mb-50">
                        <div class="profile-title mb-20">{{ __('Short description') }}</div>
                        <div class="profile-description mw-1200" v-html="descriptionPreview"></div>
                    </div>

                    <a class="btn btn-outline-primary btn-lg rounded-pill" href="#" @click.prevent="cancel()">
                        {{ __('Back to editing') }}
                    </a>
                </div>
            </div>


        </div>

    </div>

</template>

<script>
import {useWizardCandidate} from "../wizard/useWizardOptions";
import {inject, computed} from "vue";
import {nl2br, pluralizeValue} from "../../../utils/string";
import * as URLUtils from "../../../utils/url";
import {trans} from "../../i18n/lang";

export default {
    name: "CandidatePreview",
    props: {
        wizard: {
            type: Boolean,
            default: false,
        }
    },
    setup(props, {__}) {
        const namespace = inject("STORE_NAMESPACE");
        const options = inject("WIZARD_OPTIONS");

        let spec_options = [];
        options['specializations'].forEach(cat => {
            spec_options = [...spec_options, ...cat.items];
        });

        const profile = useWizardCandidate(namespace);

        const descriptionPreview = computed(() => nl2br(profile.description.value || ''));

        const isFreelance = computed(() => !!options.employment_types.find(opt => {
            return profile.employment_types.value.indexOf(opt.id) !== -1 && opt.freelance
        }));

        const experience_title = computed(() => {
            if (profile.experience.value === 0) {
                return trans('candidate.experience-title.without');
            }
            if (profile.experience.value === 1) {
                return trans('candidate.experience-title.less-1-year');
            }
            if (profile.experience.value === 8) {
                return trans('candidate.experience-title.7years-p');
            }
            if (profile.experience.value === 10) {
                return trans('candidate.experience-title.10years-p');
            }
            return pluralizeValue(profile.experience.value - 1, 'год', 'года', 'лет')

        });

        const english_title = computed(() => {
            return options.english_titles[profile.english_level.value];
        });

        const price_title = computed(() => {

            if (isFreelance.value) {
                if (profile.price_freelance.value) {
                    return profile.price_freelance.value.toLocaleString('ru-RU', {
                        style: 'currency',
                        currency: 'RUB',
                        maximumFractionDigits: 0
                    }) + '/' + trans('ч')
                }
            } else if (profile.price_full_time.value) {
                return profile.price_full_time.value.toLocaleString('ru-RU', {
                    style: 'currency',
                    currency: 'RUB',
                    maximumFractionDigits: 0
                })
            }
            return '';
        });

        const location_title = computed(() => {

            const cities = options.cities.filter(c => profile.cities.value.indexOf(c.id) !== -1);
            let title = cities.map(c => c.title).join(', ');
            const remotely = options.employment_types.find(et => et.remotely);
            let isRemotely = remotely && profile.employment_types.value.indexOf(remotely.id) !== -1;
            if (isRemotely) {
                if (title.length > 0) {
                    title += ' <span class="alt">или</span> ';
                }
                title += remotely.title;
            }
            return title;
        });

        const optionTitle = (key, id) => {
            let option;
            if (key === 'specializations') {
                option = spec_options.find(o => o.id === id);
            } else if (key === 'skills') {
                return id;
            } else {
                option = options[key].find(o => o.id === id);
            }

            return option ? option.title : '';
        }

        const cancel = () => {
            if (props.wizard) {
                URLUtils.updateQuery('/profile/wizard', {step: 2});
            } else {
                URLUtils.updateQuery('/profile');
            }

            profile.preview.value = false
        }

        return {
            ...profile,
            options,
            optionTitle,
            experience_title,
            english_title,
            price_title,
            location_title,
            cancel,
            descriptionPreview,
            isFreelance,
        }
    }

}
</script>

<style scoped>

</style>
