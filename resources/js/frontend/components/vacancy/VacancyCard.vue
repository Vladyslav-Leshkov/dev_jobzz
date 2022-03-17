<template>
    <div class="vacancy-item card">
        <div class="row gx-3 flex-lg-nowrap">
            <div class="col-12 col-lg-auto vacancy-profile-col">
                <div class="profile-avatar">
                    <img v-if="item.has_avatar || !item.initials" :alt="item.name" :src="item.avatar_url">
                    <span v-if="!item.has_avatar && !!item.initials" class="avatar-initials">
                        {{ item.initials }}
                    </span>
                    <div class="profile-name">
                        {{ item.first_name }}<br>
                        {{ item.last_name }}
                    </div>
                    <div v-if="item.position" class="profile-position">
                        {{ item.position }}
                    </div>
                    <div v-if="item.total_hires >= 3" class="card-star"></div>
                    <div v-if="item.total_hires >= 1 && item.total_hires < 3" class="card-check"></div>
                </div>
            </div>
            <div class="col-12 col-lg vacancy-info-col">

                <div class="row vacancy-info ">
                    <div class="col">
                        <div class="publish-date">{{ __('Publish Date') }} {{ publish_date }}</div>
                        <a :href="item.url" class="vacancy-title mb-20"
                           :class="{visited: visited}">{{ item.title }}</a>
                        <div class="vacancy-meta mb-30">
                            <div class="meta-item meta-location">
                                <div class="meta-title text-nowrap">{{ __('Location') }}</div>
                                <div class="meta-value" v-html="item.location_title"></div>
                            </div>
                            <div class="meta-item meta-experience">
                                <div class="meta-title text-nowrap">{{ __('Experience') }}</div>
                                <div class="meta-value text-nowrap">{{ item.experience_title }}</div>
                            </div>
                            <div class="meta-item meta-english">
                                <div class="meta-title text-nowrap">{{ __('English level') }}</div>
                                <div class="meta-value text-nowrap">{{ item.english_title }}</div>
                            </div>
                            <div v-if="item.is_product" class="meta-item meta-additional">
                                <div class="meta-title text-nowrap">{{ __('Add. Information') }}</div>
                                <div class="meta-value">{{ __('Product company') }}</div>
                            </div>
                        </div>
                    </div>
                    <div v-if="item.company" class="col-auto text-center">
                        <img :alt="item.company.title" :src="item.company.logo_url" class="company-logo">
                        <div class="company-title">{{ item.company.title }}</div>
                    </div>
                </div>

                <div class="vacancy-description mb-30" v-html="short_description"></div>
            </div>

        </div>
    </div>
</template>

<script>
import moment from "moment";
import {computed} from "vue";
import {nl2br} from "../../../utils/string";

export default {
    name: "VacancyCard",
    props: {
        item: Object,
    },
    setup({item}) {
        const short_description = computed(() => nl2br(item.short_description ? item.short_description : ''));
        const publish_date = moment(item.created_at).format('DD.MM.YYYY');
        const visited = computed(() => item && item.visitors_count > 0)
        return {
            short_description,
            publish_date,
            visited,
        }
    }
}
</script>

<style scoped>

</style>
