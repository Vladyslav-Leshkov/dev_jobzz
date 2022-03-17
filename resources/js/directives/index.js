import debounce from "./debounce";


export default {
    install: (app, options) => {

        app.use(require('./click-outside').default);
        app.use(require('./only-number').default);
        app.directive('debounce', (el, binding) => debounce(el, binding))
    }
}
