<template>
    <div class="sidebar sidebar-filter">
        <div class="divider mb-25"></div>

        <filter-block :title="__('Specialization')">
            <div v-for="specGroup in options.specializations">
                <div class="sidebar-subtitle">{{ specGroup.title }}</div>
                <div class="mb-15">
                    <radio-btn v-for="option in specGroup.items"
                               :key="'spec-'+option.id"
                               v-model="spec"
                               :value="option.id"
                               class="mb-8 me-8"
                               name="spec"
                    >{{ option.title }}
                    </radio-btn>
                </div>
            </div>
        </filter-block>
        <div class="divider my-25"></div>

        <filter-block :title="__('Employment type')">
            <div class="custom-check-group">
                <check-btn v-for="option in options.employment_types"
                           :key="'empl-'+option.id"
                           v-model="empl"
                           :value="option.id"
                           class="mb-8 me-8"
                           name="empl"
                >{{ option.title }}
                </check-btn>
            </div>
        </filter-block>

        <div class="divider my-25"></div>

        <div class="filter-block">
            <div class="filter-block-title">{{ __("Location \\ Cities") }}</div>
            <div class="filter-block-body">
                <form-chips v-model="cid"
                            :options="cities"
                            name="cid"
                            :placeholder="__('Enter the name of the city')"
                >
                    <div class="custom-check-group">
                        <check-btn v-for="option in popularCities"
                                   :key="'city-'+option.id"
                                   v-model="cid"
                                   :value="option.id"
                                   class="mb-8 me-8"
                                   name="cid"
                        >{{ option.title }}
                        </check-btn>
                    </div>
                </form-chips>
            </div>
        </div>

        <div class="divider my-25"></div>

        <filter-block :title="__('Work experience')">
            <check-btn key="exp-0" v-model="exp" class="mb-8 me-8" name="exp" value="0">{{ __('Without experience') }}
            </check-btn>
            <check-btn key="exp-1" v-model="exp" class="mb-8 me-8" name="exp" value="<1">{{ __('Less than a year') }}
            </check-btn>
            <check-btn key="exp-2" v-model="exp" class="mb-8 me-8" name="exp" value="1">{{ __('1 year') }}</check-btn>
            <check-btn key="exp-3" v-model="exp" class="mb-8 me-8" name="exp" value="2,3">{{ __('2-3 years') }}
            </check-btn>
            <check-btn key="exp-4" v-model="exp" class="mb-8 me-8" name="exp" value="4,5">{{ __('4-5 years') }}
            </check-btn>
            <check-btn key="exp-5" v-model="exp" class="mb-8 me-8" name="exp" value="5+">{{ __('5 years or more') }}
            </check-btn>
        </filter-block>

        <div class="divider my-25"></div>

        <filter-block :title="__('English level')">

            <form-check-group key="english"
                              v-model="eng"
                              :options="options.english_levels"
                              name="eng"/>
        </filter-block>

        <div class="divider my-25"></div>

        <filter-block :title="__('The salary')">
            <form-price v-model:from-value="sal_from" v-model:to-value="sal_to"></form-price>
        </filter-block>

    </div>
</template>

<script>
import FilterBlock from "../common/FilterBlock";
import {computed, provide} from "vue";
import FilterCollapse from "../common/FilterCollapse";
import FormCheckGroup from "../form/FormCheckGroup";
import ChipSelector from "../wizard/ChipSelector";
import FormChips from "../form/FormChips";
import CheckBtn from "../form/CheckBtn";
import FormRange from "../form/FormRange";
import {pluralizeValue} from "../../../utils/string";

import wNumb from '../../../utils/wnumb';

import {useCandidateFilter} from "./useCandidateFilter";
import {useStore} from "vuex";
import FormRadioBtn from "../form/FormRadioBtn";
import RadioBtn from "../form/RadioBtn";
import FormPrice from "../form/FormPrice";

export default {
    name: "CandidateSidebar",
    components: {
        FormPrice,
        RadioBtn,
        FormRadioBtn,
        FormRange,
        CheckBtn,
        FormChips,
        ChipSelector,
        FormCheckGroup,
        FilterCollapse,
        FilterBlock
    },
    props: {
        options: Object,

    },
    setup(props) {
        provide("FILTER_OPTIONS", props.options);

        const cities = props.options.cities.filter(c => c.popular === 0);
        const popularCities = props.options.cities.filter(c => c.popular === 1);

        const formData = useCandidateFilter();

        return {
            ...formData,
            cities,
            popularCities,

        }
    }
}
</script>

<style scoped>

</style>
