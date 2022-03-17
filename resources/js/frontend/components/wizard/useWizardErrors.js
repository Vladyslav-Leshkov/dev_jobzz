import {scrollTo} from "../../../utils/functions";

export const scrollToError = function (errors = {}, suffix = '_section', prefix = '', offset = 0) {
    const keys = Object.keys(errors);
    if (keys.length) {
        scrollTo('#' + prefix + keys[0] + suffix, offset);
    }
}

export const useWizardErrors = function () {
    return {
        scrollToError,
    }
}
