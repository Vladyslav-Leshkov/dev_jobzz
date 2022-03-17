import {createStore, createLogger} from "vuex";

import notifications from "./modules/notifications";
import messenger from '../../frontend/store/modules/messenger';

import createPersistedState from "vuex-persistedstate";
const psState = createPersistedState({
    key: 'backend',
    paths: [
        'notifications',
    ]
});


const logger = createLogger();

const plugins = [psState];

if(process.env.NODE_ENV !== 'production'){
    plugins.push(logger);
}

const store = createStore({
    modules: {
        notifications,
        messenger,
    },
    plugins: plugins,
});

export default store;

