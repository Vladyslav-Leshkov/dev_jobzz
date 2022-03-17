<template>
    <div class="vacancy-search">
        <div class="vacancy-search-group mb-8">
            <input id="vs-input"
                   v-model.trim="q"
                   :placeholder="__('Enter keywords')"
                   class="vacancy-search-input"
                   name="q"
                   autocomplete="off"
                   ref="inputRef"
                   type="text"
                   @blur="blur()"
                   @focus="focus = true"
            >
            <label class="vacancy-search-label" for="vs-input" @click="search()">{{ __('Search') }}</label>
        </div>
        <div class="font-16 fw-500 mb-16">
            {{ __('Results found') }}:
            <span class="text-success">{{ total }}</span>
        </div>
    </div>

</template>

<script>
import SvgIcon from "../svg/SvgIcon";
import {computed, ref} from "vue";
import {useStore} from "vuex";
import VacancyTotal from "./VacancyTotal";
import {pluralize, pluralizeValue} from "../../../utils/string";
import {trans} from "../../i18n/lang";

export default {
    name: "VacancySearch",
    components: {VacancyTotal, SvgIcon},
    props: {
        pageTitle: String,
    },
    setup(props) {
        const store = useStore();

        const q = computed({
            get: () => store.getters["vacancyFilter/q"],
            set: _.debounce((val) => store.commit('vacancyFilter/UPDATE_FORM_DATA', {q: val}), 300)
        });

        const inputRef = ref(null);
        const timeout = ref(null);
        const focus = ref(false);

        const total = computed(() => store.state.vacancyList.total);

        const blur = async (evt) => {
            timeout.value = setTimeout(() => {
                focus.value = false;
            }, 200);
        }
        const search = () => {
            clearTimeout(timeout.value);
            inputRef.value.focus();
            focus.value = true;
        }
        return {
            q,
            inputRef,
            focus,
            search,
            blur,
            total,
        }
    }
}
</script>

<style scoped>

</style>
