<template>
    <div>
        <div class="page-header mb-30 mb-lg-50 pb-25">
            <div class="container-fluid container-lg">
                <div class="page-header-body">
                    <h1 class="page-header-title mb-5"><span>{{ __('Vacancy preview') }}</span></h1>
                    <div class="page-header-action">
                        <a class="text-success" href="#" @click.prevent="close()">{{ __('Back to editing') }}</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mb-50 mb-lg-100">
            <div class="profile-item vacancy-page">
                <div class="profile-row">
                    <div class="profile-col-avatar">
                        <div class="profile-avatar">
                            <img v-if="user.has_avatar" :alt="user.name" :src="user.avatar_url">
                            <span v-if="!user.has_avatar" class="avatar-initials">
                                {{ user.initials }}
                            </span>
                            <div class="profile-name">
                                {{ user.first_name }}<br>
                                {{ user.last_name }}
                            </div>
                            <span class="profile-position">{{ user.position }}</span>
                            <span class="profile-position"> в {{ company.title }}</span>
                        </div>
                    </div>
                    <div class="profile-col-text">
                        <div class="publish-date">{{ __('Publish Date') }} {{ createdAt }}</div>
                        <div class="row flex-column-reverse flex-md-row">
                            <div class="col mb-20 mb-md-5">
                                <div class="profile-title">{{ vacancy.title }}</div>
                            </div>
                            <div v-if="company" class="col-auto mb-20 mb-md-5 text-center">
                                <img :alt="company.title" :src="company.logo_url" class="company-logo">
                            </div>
                        </div>
                        <div class="vacancy-meta mb-30">
                            <div class="meta-item">
                                <div class="meta-title">{{ __('Location') }}</div>
                                <div class="meta-value" v-html="location_title"></div>
                            </div>
                            <div class="meta-item">
                                <div class="meta-title text-nowrap">{{ __('An experience') }}</div>
                                <div class="meta-value">{{ experience_title }}</div>
                            </div>
                            <div class="meta-item">
                                <div class="meta-title">{{ __('English level') }}</div>
                                <div class="meta-value">{{ english_title }}</div>
                            </div>
                        </div>
                        <div class="vacancy-description mb-30">
                            <p v-html="short_description" class="fw-bold"></p>
                            <div v-html="description"></div>
                        </div>
                        <template v-if="company">
                            <hr class="mb-40">
                            <div class="profile-title mb-15">{{ __('About company') }} {{ company.title }}</div>
                            <div class="company-description mb-30 font-15" v-html="company_description"></div>
                            <div class="company-meta mb-20">
                                <div v-if="company.address" class="meta-item">
                                    <div class="meta-icon">
                                        <svg-icon icon="building"/>
                                    </div>
                                    <div>
                                        <div class="meta-title">{{ __('Headquarters') }}:</div>
                                        <div class="meta-value">{{ company.address }}</div>
                                    </div>
                                </div>
                                <div v-if="company.website" class="meta-item">
                                    <div class="meta-icon">
                                        <svg-icon icon="url"/>
                                    </div>
                                    <div>
                                        <div class="meta-title">{{ __('Website') }}:</div>
                                        <div class="meta-value"><a :href="company.website" rel="nofollow"
                                                                   target="_blank">{{ company.website }}</a></div>
                                    </div>
                                </div>
                            </div>
                        </template>

                        <a class="btn btn-outline-primary btn-lg rounded-pill" href="#" @click.prevent="close()">
                            {{ __('Back to editing') }}
                        </a>
                    </div>
                </div>


            </div>
        </div>
    </div>
</template>

<script>
import moment from "moment";
import {nl2br, pluralizeValue} from "../../../utils/string";
import {computed} from "vue";
import SvgIcon from "../svg/SvgIcon";

export default {
    name: "VacancyPreview",
    components: {SvgIcon},
    props: {
        vacancy: Object,
        user: Object,
        company: Object,
        options: Object,
    },
    emits: ['close'],
    setup({vacancy, user, company, options}, {emit}) {

        const close = () => emit('close');
        const createdAt = moment().format('DD.MM.YYYY');
        const description = computed(() => vacancy.description || '');
        const short_description = computed(() => nl2br(vacancy.short_description || ''));
        const company_description = computed(() => nl2br(company.description || ''));

        const experience_title = computed(() => {
            if (vacancy.experience === 0) {
                return 'Без опыта';
            }
            if (vacancy.experience === 8) {
                return 'от 7 до 10 лет';
            }
            if (vacancy.experience === 6) return '5 лет и более';
            if (vacancy.experience === 1) {
                return 'Менее года';
            }
            return 'от ' + pluralizeValue(vacancy.experience - 1, 'года', 'лет', 'лет')

        });

        const english_title = computed(() => {
            return options.english_titles[vacancy.english_level];
        });


        const location_title = computed(() => {

            const cities = options.cities.filter(c => vacancy.cities.indexOf(c.id) !== -1);
            let title = cities.map(c => c.title).join(', ');
            const remotely = options.employment_types.find(et => et.remotely);
            let isRemotely = remotely && vacancy.employment_types.indexOf(remotely.id) !== -1;
            if (isRemotely) {
                if (title.length > 0) {
                    title += ' <span class="alt">или</span> ';
                }
                title += remotely.title;
            }
            return title;
        });

        return {
            createdAt,
            experience_title,
            english_title,
            location_title,
            close,
            description,
            short_description,
            company_description,
        }
    }
}
</script>

<style scoped>

</style>
