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
import {useStore} from "vuex";
import {computed, ref} from "vue";

export default {
    name: "CandidateSearch",
    components: {SvgIcon},
    setup(props) {
        const store = useStore();

        const q = computed({
            get: () => store.getters["candidateFilter/q"],
            set: _.debounce((val) => store.commit('candidateFilter/UPDATE_FORM_DATA', {q: val}), 300)
        });

        const total = computed(() => store.state.candidateList.total);

        const inputRef = ref(null);
        const timeout = ref(null);
        const focus = ref(false);

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
            focus,
            inputRef,
            blur,
            search,
            total,
        }
    }
}
</script>

<style scoped>

</style>
