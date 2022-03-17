<template>
    <li>
        <slot/>
    </li>
</template>

<script>
import {useStore} from "vuex";
import {useI18n} from "vue-i18n";
import moment from 'moment';

export default {
    name: "LangToggle",
    props: {
        locale: String,
    },
    setup(props) {
        const store = useStore();
        store.commit('common/SET_LOCALE', props.locale);
        const {locale} = useI18n({useScope: 'global'});
        moment.locale(props.locale);
        if (locale.value !== props.locale) {
            locale.value = props.locale;
        }
    }
}
</script>

<style scoped>

</style>