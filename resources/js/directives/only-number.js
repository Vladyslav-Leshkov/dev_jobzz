const KEY_EVENT = 'keyup';

const UNIQUE_ID = "__vue_only_number__";

const onMounted = (el, binding, vnode) => {
    el[UNIQUE_ID] = function (event) {
        let regex = /^[0-9]*$/
        if (!regex.test(el.value)) {
            el.value = el.value.slice(0, -1)
        }
    };
    document.body.addEventListener(KEY_EVENT, el[UNIQUE_ID]);
}

const onUnmounted = (el) => {
    document.body.removeEventListener(KEY_EVENT, el[UNIQUE_ID]);
}

const directive = {
    mounted: onMounted,
    unmounted: onUnmounted,
};

const mixin = {
    directives: {OnlyNumber: directive},
};

const plugin = {
    install: (app) => {
        app.directive('only-number', directive)
    }
}

export {
    directive,
    mixin
}

export default plugin;
