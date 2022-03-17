export default {
    install: (app, options) => {

        app.component('lang-toggle', require('./common/LangToggle').default);

        app.component('svg-icon', require('./svg/SvgIcon').default);

        app.component('auth-form', require('./auth/AuthForm').default);
        app.component('registration-form', require('./auth/RegistrationForm').default);
        app.component('role-form', require('./auth/RoleForm').default);

        app.component('candidate-wizard', require('./candidate/CandidateWizard').default);
        app.component('candidate-account', require('./candidate/CandidateAccount').default);
        app.component('candidate-sidebar', require('./candidate/CandidateSidebar').default);
        app.component('candidate-search', require('./candidate/CandidateSearch').default);
        app.component('candidate-list', require('./candidate/CandidateList').default);
        app.component('candidate-total', require('./candidate/CandidateTotal').default);
        app.component('candidate-offer', require('./candidate/CandidateOffer').default);
        app.component('candidate-contacts', require('./candidate/CandidateContacts').default);
        app.component('candidate-hiring-form', require('./candidate/CandidateHiringForm').default);
        app.component('candidate-payment-form', require('./candidate/CandidatePaymentForm').default);
        app.component('candidate-payment-archive', require('./candidate/CandidatePaymentArchive').default);
        app.component('candidate-delete-form', require('./candidate/CandidateDeleteForm').default);

        app.component('recruiter-wizard', require('./recruiter/RecruiterWizard').default);
        app.component('recruiter-account', require('./recruiter/RecruiterAccount').default);
        app.component('recruiter-amount-to-pay', require('./recruiter/RecruiterAmountToPay').default);
        app.component('recruiter-invoice-form', require('./recruiter/RecruiterInvoiceForm').default);
        app.component('recruiter-confirm', require('./recruiter/RecruiterConfirm').default);

        app.component('vacancy-form', require('./vacancy/VacancyForm').default);
        app.component('vacancy-total', require('./vacancy/VacancyTotal').default);
        app.component('vacancy-sidebar', require('./vacancy/VacancySidebar').default);
        app.component('vacancy-list', require('./vacancy/VacancyList').default);
        app.component('vacancy-offer', require('./vacancy/VacancyOffer').default);
        app.component('vacancy-search', require('./vacancy/VacancySearch').default);
        app.component('vacancy-close-btn', require('./vacancy/VacancyCloseBtn').default);
        app.component('vacancy-hiring-btn', require('./vacancy/VacancyHiringBtn').default);

        app.component('messenger', require('./messenger/Messenger').default);
        app.component('messenger-link', require('./messenger/MessengerLink').default);
        app.component('messenger-badge', require('./messenger/MessengerBadge').default);
        app.component('messenger-sb-toggle', require('./messenger/MessengerSbToggle').default);

        app.component('push-questions', require('./push-questions/PushQuestions').default);

    }
}
