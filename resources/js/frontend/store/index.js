import {createStore, createLogger} from "vuex";

import candidateWizard from './modules/candidate-wizard';
import candidateFilter from './modules/candidate-filter';
import candidateList from './modules/candidate-list';
import recruiterWizard from './modules/recruiter-wizard';
import recruiterProfile from './modules/recruiter-profile';
import vacancyList from './modules/vacancy-list';
import vacancyFilter from './modules/vacancy-filter';
import messenger from './modules/messenger';
import common from './modules/common';
import createPersistedState from "vuex-persistedstate";

const psState = createPersistedState({
    paths: [
        'candidateWizard',
        'recruiterWizard',
        'recruiterProfile',
        'common',
    ]
});


const logger = createLogger();

const plugins = [psState];

if (process.env.NODE_ENV !== 'production') {
    plugins.push(logger);
}

const store = createStore({
    modules: {
        candidateWizard,
        candidateFilter,
        candidateList,
        recruiterWizard,
        recruiterProfile,
        vacancyList,
        vacancyFilter,
        messenger,
        common,
    },
    plugins: plugins,
});

export default store;
