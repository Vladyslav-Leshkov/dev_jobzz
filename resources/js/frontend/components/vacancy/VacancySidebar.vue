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
        <filter-block :title="__('Location \\ Cities')">
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
                    <check-btn v-model="remotely" :value="1" class="mb-8 me-8" name="remotely">
                        {{ __('Remote work') }}
                    </check-btn>
                </div>
            </form-chips>
        </filter-block>

        <div class="divider my-25"></div>

        <filter-block :title="__('Work experience')">
            <check-btn key="exp-0" v-model="exp" class="mb-8 me-8" name="exp" value="0">
                {{ __('Without experience') }}
            </check-btn>
            <check-btn key="exp-1" v-model="exp" class="mb-8 me-8" name="exp" value="<1">
                {{ __('Less than a year') }}
            </check-btn>
            <check-btn key="exp-2" v-model="exp" class="mb-8 me-8" name="exp" value="1">
                {{ __('1 year') }}
            </check-btn>
            <check-btn key="exp-3" v-model="exp" class="mb-8 me-8" name="exp" value="2,3">
                {{ __('2-3 years') }}
            </check-btn>
            <check-btn key="exp-4" v-model="exp" class="mb-8 me-8" name="exp" value="4,5">
                {{ __('4-5 years') }}
            </check-btn>
            <check-btn key="exp-5" v-model="exp" class="mb-8 me-8" name="exp" value="5+">
                {{ __('5 years or more') }}
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

        <filter-block :title="__('Salary')">
            <form-radio-btn v-for="option in options.salaries"
                            :key="'sal-'+option.id"
                            v-model="sal"
                            :unchecked-value="0"
                            :value="option.id"
                            class="mb-8 me-8"
                            name="sal"
            >{{ __('vacancy.from') }} {{ formatAmount(option.sum_rub) }}
            </form-radio-btn>
        </filter-block>

        <div class="filter-block">
            <div class="subtitle">{{ __('Additionally') }}</div>
            <div>
                <check-btn key="relocate" v-model="relocate" :unchecked-value="0" :value="1" class="mb-8 me-8"
                           name="relocate">
                    {{ __('Relocate to another country') }}
                </check-btn>
                <check-btn key="help_relocate" v-model="help_relocate" :unchecked-value="0" :value="1" class="mb-8 me-8"
                           name="help_relocate">
                    {{ __('Help with relocation') }}
                </check-btn>
                <check-btn key="is_product" v-model="is_product" :unchecked-value="0" :value="1" class="mb-8 me-8"
                           name="is_product">
                    {{ __('Product companies') }}
                </check-btn>
            </div>
        </div>
    </div>
</template>

<script>
import FilterBlock from "../common/FilterBlock";
import CheckBtn from "../form/CheckBtn";
import {useVacancyFilter} from "./useVacancyFilter";
import {provide} from "vue";
import FormChips from "../form/FormChips";
import FormCheckGroup from "../form/FormCheckGroup";
import FormRadioBtn from "../form/FormRadioBtn";
import RadioBtn from "../form/RadioBtn";
import {toAmount} from "../../../utils/number";
import {useStore} from "vuex";

export default {
    name: "VacancySidebar",
    components: {
        RadioBtn,
        FormRadioBtn,
        FormCheckGroup,
        FormChips,
        CheckBtn,
        FilterBlock,
    },
    props: {
        options: Object,
        specItem: {
            type: [Object],
            default: null
        },
    },
    setup(props) {
        const formData = useVacancyFilter();
        provide("FILTER_OPTIONS", props.options);

        const cities = props.options.cities.filter(c => c.popular === 0);
        const popularCities = props.options.cities.filter(c => c.popular === 1);

        if (props.specItem !== null) {
            formData.spec.value = [props.specItem.id];
        }

        const formatAmount = (val) => {
            return '₽ ' + toAmount(val);
        }

        return {
            ...formData,
            cities,
            popularCities,
            formatAmount,
        }
    }
}
</script>

<style scoped>

</style>
