import {useI18n} from "vue-i18n";
import {ucfirst} from "../../../utils/string";

export const useI18nLocal = (options) => {
    const {locale} = useI18n({useScope: 'global'});

    const t = (key, count = '') => {
        if (options.messages && options.messages[locale.value] && options.messages[locale.value][key]) {
            return options.messages[locale.value][key].replace('{count}', count);
        } else {
            return ucfirst(key.replace('_', ' '));
        }

    }

    return {
        t,
        locale,
    }
}
