<template>
    <div class="profile-item">
        <div>
            <div class="publish-date">{{ __('Publish Date') }} {{ publish_date }}</div>
            <a :href="item.url" class="profile-title" :class="{visited: visited}">{{ item.position }}</a>
            <div class="profile-meta mb-15">
                <div class="meta-item">
                    <div class="meta-title">{{ __('Experience') }}</div>
                    <div class="meta-value">{{ item.experience_title }}</div>
                </div>
                <div class="meta-item">
                    <div class="meta-title">{{ __('English level') }}</div>
                    <div class="meta-value text-nowrap">{{ item.english_title }}</div>
                </div>
                <div class="meta-item text-success"
                     v-if="(item.is_freelance && item.price_freelance > 0) || (!item.is_freelance && item.price_full_time > 0)">
                    <div class="meta-title">{{ __('Salary') }}</div>
                    <div class="meta-value text-nowrap">
                        {{ item.is_freelance ? item.price_freelance_title : item.price_title }}
                    </div>
                </div>
                <div class="meta-item">
                    <div class="meta-title">{{ __('Location') }}</div>
                    <div class="meta-value" v-html="item.location_title"></div>
                </div>
            </div>
            <hr class="mw-640">
            <div v-if="item.skills.length" class="mb-20">
                <div class="profile-subtitle">{{ __('Basic skills') }}</div>
                <div class="profile-badges">
                    <div v-for="skill in item.skills" class="badge rounded-pill bg-secondary badge-md me-10">
                        {{ skill.title }}
                    </div>
                </div>
            </div>
            <div v-if="item.additional_skills.length && item.skills.length === 0" class="mb-20">
                <div class="profile-subtitle">{{ __('Skills') }}</div>
                <div class="profile-badges">
                    <div v-for="skill in item.additional_skills" class="badge rounded-pill bg-white badge-md me-10">
                        {{ skill.title }}
                    </div>
                </div>
            </div>
            <div v-if="item.description" class="mb-0">
                <div class="profile-subtitle mb-10">{{ __('About myself') }}</div>
                <div class="profile-description" v-html="short_description"></div>
            </div>
        </div>
    </div>
</template>

<script>
import moment from "moment";
import {computed} from "vue";
import {nl2br} from "../../../utils/string";


export default {
    name: "CandidateCard",
    props: {
        item: Object
    },
    setup({item}) {
        const short_description = computed(() => nl2br((item.description && item.description.length > 500) ? item.description.substr(0, 500) + '...' : item.description));
        const publish_date = computed(() => moment(item.created_at).format('DD.MM.YYYY'));
        const visited = computed(() => item && item.visitors_count > 0);
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
