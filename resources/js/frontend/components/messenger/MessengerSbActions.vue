<template>
    <div class="msgr-sb-actions" :class="{active: active}">
        <div class="mb-15">
            <form-select class="msgr-sb-sort" name="msgr_sort_by" v-model="sortBy" :options="sortOptions"></form-select>

            <input type="text"
                   class="msgr-sb-search"
                   @focus="focus = true"
                   @blur="focus = false"
                   :placeholder="placeholder"
                   v-model.trim="searchQuery"
            >
        </div>
        <div class="divider"></div>
    </div>
</template>

<script>
import FormSelect from "../form/FormSelect";
import {useStore} from "vuex";
import {computed, ref} from "vue";
import {trans} from "../../i18n/lang";

export default {
    name: "MessengerSbActions",
    components: {
        FormSelect
    },
    setup() {
        const store = useStore();

        const sortOptions = [
            {id: 'unread', title: trans('Unread at the top')},
            {id: 'date', title: trans('Sort by date')},
        ];

        const sortBy = computed({
            get: () => store.state.messenger.sortBy,
            set: (value) => store.commit('messenger/SET_SORT', value),
        });

        const searchQuery = computed({
            get: () => store.state.messenger.searchQuery,
            set: _.debounce((val) => {
                store.commit('messenger/SET_CONTACTS_PAGE', 1);
                store.commit('messenger/SET_SEARCH_QUERY', val);
                store.dispatch('messenger/fetchContacts');
            }, 300)
        });

        const focus = ref(false);
        const active = computed(() => searchQuery.value.length || focus.value);
        const placeholder = computed(() => active.value ? trans('Enter name...') : '');

        return {
            sortOptions,
            sortBy,
            searchQuery,
            focus,
            placeholder,
            active,
        }
    }
}
</script>

<style scoped>

</style>
