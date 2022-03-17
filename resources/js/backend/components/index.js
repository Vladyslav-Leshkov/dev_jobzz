export default {
    install: (app, options) => {
        app.component('header-notifications', require('./HeaderNotifications').default);
        app.component('rec-mod-badge', require('./RecruiterModerateBadge').default);
        app.component('can-mod-badge', require('./CandidateModerateBadge').default);

        app.component('messenger', require('./messenger/AdminMessenger').default);
        app.component('msg-badge', require('./messenger/UnreadMessagesBadge').default);
        app.component('nav-messages', require('./messenger/NavMessages').default);
        app.component('translation-editor', require('./translation/TranslationEditor').default);


    }
}
