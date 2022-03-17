require('../common');
require('./frontend');
require('../modules/copy-to-clipboard');
require('../modules/sweetalert');


import {createApp} from 'vue';


const app = createApp({});

// TODO: Вместо этого использовать laravel-vue-lang
import i18n from './i18n';

app.use(i18n);


import {Lang} from './i18n/lang';

// Register the plugin
app.use(Lang, {
    locale: document.documentElement.lang || 'ru',
    fallback: 'en',
});

require('./validation/rules');

import store from "./store";

app.use(store);

import globalComponents from "./components";

app.use(globalComponents);

import directives from "../directives";

app.use(directives);

const vm = app.mount('#app');
window.vm = vm;
