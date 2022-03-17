import {createApp} from 'vue';
import store from "./store";

require('../common');


// Global
//require("./modules/bootstrap") ;
require("./modules/theme");
require("./modules/feather");
require("./modules/moment");
require("./modules/sidebar");

require("../modules/sweetalert");

// Forms
require("./modules/flatpickr");

// Charts
require("./modules/chartjs");

// Maps
require("./modules/vector-maps");

// Image Upload
require("./modules/image-upload");


// Toast notifications
require("../modules/toast");

// Form
require("./modules/ajax-switch");
require("./modules/select-choices");

//
require('livewire-sortable');


const app = createApp({});


// TODO: Вместо этого использовать laravel-vue-lang
import i18n from './i18n';

app.use(i18n);


import {Lang} from 'laravel-vue-lang';

// Register the plugin
app.use(Lang, {
    locale: 'ru',
    fallback: 'en',
});

import globalComponents from "./components";

app.use(globalComponents);

app.use(store);
import directives from "../directives";

app.use(directives);

const vm = app.mount('#app');
window.vm = vm;
