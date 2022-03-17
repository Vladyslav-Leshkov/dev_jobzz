import {axiosGet, axiosPatch, axiosPost} from "../../services/api";
import moment from "moment";
import axios from 'axios';
import {br2nl, stripHtml} from "../../../utils/string";

let cancelTokenSource = axios.CancelToken.source();
let cancelCTSource = axios.CancelToken.source();

const MESSENGER_CONTACT_SORT = 'MESSENGER_CONTACT_SORT';

export default {
    namespaced: true,
    state: () => ({
        sidebarOpen: true,
        currentUser: null,
        currentContacts: null,
        fieldsContacts: {},
        fileUpload: null,
        supportUser: null,
        selectedUser: null,
        loading: false,
        loading_contacts: false,
        loading_messages: false,
        sending_request: false,
        hiring: {
            released_to_work: '',
            vacancy_id: 0,
        },
        unreadCount: 0,
        unreadMessages: [],
        sortBy: localStorage.getItem(MESSENGER_CONTACT_SORT) || 'date',
        searchQuery: '',
        recruiter_vacancies: {
            recruiter_id: 0,
            vacancies: []
        },
        has_more_contacts: true,
        contacts_page: 1,
        contacts: [],
        messages: [],
        messages_current_page: 1,
        messages_last_page: 1,
        messageText: '',
        selectedMessage: null,
    }),
    mutations: {
        TOGGLE_SIDEBAR(state, value) {
            if (value === null) {
                state.sidebarOpen = !state.sidebarOpen;
            } else {
                state.sidebarOpen = value;
            }
        },
        SET_RECRUITER_VACANCIES(state, value) {
            state.recruiter_vacancies = value;
        },
        SET_HIRING(state, data) {
            Object.assign(state.hiring, data);
        },
        SET_UNREAD_COUNT(state, value) {
            state.unreadCount = value;
        },
        SET_UNREAD_MESSAGES(state, value) {
            state.unreadMessages = value;
        },
        SET_CURRENT_USER(state, value) {
            state.currentUser = value;
        },
        SET_CURRENT_CONTACTS(state, value) {
            state.currentContacts = value;
        },
        SET_FIELDS_CONTACTS(state, value) {
            state.fieldsContacts = value;
        },
        SET_FILE_UPLOAD(state, payload) {
            state.fileUpload = payload.file;
        },
        SET_SUPPORT_USER(state, value) {
            state.supportUser = value;
        },
        SET_SELECTED_USER(state, value) {
            state.selectedUser = value;
        },
        SET_LOADING(state, value) {
            state.loading = value;
        },
        SET_LOADING_MESSAGES(state, value) {
            state.loading_messages = value;
        },
        SET_SORT(state, value) {
            state.sortBy = value;
            localStorage.setItem(MESSENGER_CONTACT_SORT, value);
        },
        SET_SEARCH_QUERY(state, value) {
            state.contacts_page = 1;
            state.searchQuery = value;
        },
        SET_CONTACTS(state, value) {
            state.contacts = value;
        },
        SET_CONTACTS_PAGE(state, value) {
            state.contacts_page = value;
        },
        SET_MORE_CONTACTS(state, value) {
            state.has_more_contacts = value;
        },
        ADD_CONTACTS(state, value) {
            state.contacts = [...state.contacts, ...value];
        },
        SET_MESSAGES(state, value) {
            state.messages = value;
        },
        SET_MESSAGES_CURRENT_PAGE(state, value) {
            state.messages_current_page = value;
        },
        SET_MESSAGES_LAST_PAGE(state, value) {
            state.messages_last_page = value;
        },
        SET_SELECTED_MESSAGE(state, value) {
            state.selectedMessage = value;
        },
        SET_MESSAGE_TEXT(state, value) {
            state.messageText = value;
        },
        SET_SENDING_REQUEST(state, value) {
            state.sending_request = value;
        },
        SET_LOADING_CONTACTS(state, value) {
            state.loading_contacts = value;
        },
        MESSAGE_SEND(state, message) {
            state.messages.unshift(message);
        },
        MESSAGE_RECEIVE(state, message) {
            if (state.selectedUser && state.selectedUser.id === message.from_id) {
                const msgIdx = state.messages.findIndex(m => m.id === message.id);
                if (msgIdx !== -1) {
                    state.messages[msgIdx] = message;
                } else {
                    state.messages.unshift(message);
                }
            }
            if (message.from_id === 2) {
                state.supportUser.last_message = message;
            } else {
                const contIdx = state.contacts.findIndex(c => c.id === message.from_id);
                if (contIdx !== -1) {
                    const contact = state.contacts[contIdx];
                    contact.last_message = message;
                    state.contacts[contIdx] = contact;
                }
            }

        },
        MESSAGE_SENT(state, {token, message}) {
            const messages = state.messages;
            const idx = messages.findIndex(m => m.token && m.token === token);
            if (idx !== -1) {
                messages[idx] = message;
            }
            state.messages = messages;
            if (message.to_id === 2) {
                state.supportUser.last_message = message;
            } else {
                const contIdx = state.contacts.findIndex(c => c.id === message.to_id);
                if (contIdx !== -1) {
                    const contact = state.contacts[contIdx];
                    contact.last_message = message;
                    state.contacts[contIdx] = contact;
                }
            }

        },
        MESSAGES_SEEN(state, {user_id, ids}) {
            if (state.selectedUser.id === user_id) {
                state.messages.filter(m => ids.indexOf(m.id) !== -1).forEach(m => {
                    m.seen = true;
                })
            }
            if (user_id === 2) {
                state.supportUser.last_message.seen = true;
            } else {
                const contIdx = state.contacts.findIndex(c => c.id === user_id);
                if (contIdx !== -1 && ids.indexOf(state.contacts[contIdx].last_message.id) !== -1) {
                    const contact = state.contacts[contIdx];
                    contact.last_message.seen = true;
                    state.contacts[contIdx] = contact;
                }
            }

        },
        MESSAGE_ERROR(state, {token}) {
            const messages = state.messages;
            const idx = messages.findIndex(m => m.token && m.token === token);
            if (idx !== -1) {
                messages[idx].error = true;
            }
            state.messages = messages;
        },
        MAKE_SEEN(state) {
            const isSupport = state.currentUser.type === 'admin' || state.currentUser.type === 'support';
            const to_id = isSupport ? state.supportUser.id : state.currentUser.id;
            state.messages.filter(m => m.to_id === to_id).forEach(m => {
                m.seen = true;
            });
            if (state.selectedUser.id === 2) {
                if (state.supportUser.last_message) {
                    state.supportUser.last_message.seen = true;
                }

            } else {
                const contIdx = state.contacts.findIndex(c => c.id === state.selectedUser.id);
                if (contIdx !== -1 && state.contacts[contIdx].last_message.to_id === to_id) {
                    const contact = state.contacts[contIdx];
                    if (contact.last_message) {
                        contact.last_message.seen = true;
                    }
                    state.contacts[contIdx] = contact;
                }
            }

        },
        DATA_OPENED(state, payload) {
            const contact = state.contacts.find(c => c.id === payload.data.candidate_id);
            if (contact) {
                contact.profile_opened = true;
            }

        },
        UPDATE_MESSAGE(state, message) {
            const idx = state.messages.findIndex(m => m.id === message.id);
            if (idx > -1) {
                state.messages[idx] = message;
            }
        }
    },
    getters: {
        filteredContacts: (state) => {
            let contacts = state.contacts.slice();
            switch (state.sortBy) {
                case "date":
                    contacts.sort((a, b) => {
                        if (a.last_message && b.last_message) {
                            return moment(a.last_message.created_at).isAfter(moment(b.last_message.created_at)) ? -1 : 1;
                        }
                        return a.last_message && !b.last_message ? -1 : (b.last_message && !a.last_message ? 1 : 0);
                    });
                    break;
                case 'unread':
                    contacts.sort((a, b) => {
                        if (a.last_message && b.last_message) {
                            if ((a.last_message.seen && b.last_message.seen) || (!a.last_message.seen && !b.last_message.seen)) return 0;
                            return !a.last_message.seen && b.last_message.seen ? -1 : 1;
                        }
                        return a.last_message && !b.last_message ? -1 : (b.last_message && !a.last_message ? 1 : 0);
                    });
                    break;
            }
            if (state.searchQuery.length > 0) {
                contacts = contacts.filter(c => c.name.toLowerCase().includes(state.searchQuery.toLowerCase())
                    || c.email.toLowerCase().includes(state.searchQuery.toLowerCase()));
            }
            return contacts;
        },
        messagesGroups: (state) => {
            const groups = [];
            state.messages.slice().reverse().forEach((m) => {
                let group = groups.find(g => g.date === m.date);
                if (!group) {
                    group = {
                        date: m.date,
                        messages: []
                    }
                    groups.push(group);
                }
                group.messages.push(m);
            });
            return groups;
        },
        currentRecruiter: (state) => {
            return state.currentUser && state.currentUser.type === 'recruiter' ? state.currentUser : state.selectedUser;
        },
        currentCandidate: (state) => {
            return state.currentUser && state.currentUser.type === 'candidate' ? state.currentUser : state.selectedUser;
        },
        isCurrentSupport: (state) => {
            return state.currentUser && (state.currentUser.type === 'admin' || state.currentUser.type === 'support');
        },
        vacancies: (state) => {
            return state.recruiter_vacancies.vacancies;
        },
        selectedVacancy: (state) => {
            return state.recruiter_vacancies.vacancies.find(v => v.id === state.hiring.vacancy_id);
        }
    },
    actions: {
        async fetchVacancies({commit, getters}) {
            const recruiter_id = getters.currentRecruiter.id;
            const data = await axiosGet(`/messenger/${recruiter_id}/vacancies`);
            commit('SET_RECRUITER_VACANCIES', {recruiter_id: recruiter_id, vacancies: []});
            if (data) {
                commit('SET_RECRUITER_VACANCIES', {recruiter_id: recruiter_id, vacancies: data});
            }
        },
        async fetchUnread({commit}) {
            const data = await axiosGet('/messenger/unread');
            if (data) {
                commit('SET_UNREAD_COUNT', parseInt(data));
            }
        },

        async fetchUnreadMessages({commit}) {
            const data = await axiosGet('/messenger/unread-messages');
            if (data) {
                commit('SET_UNREAD_MESSAGES', data.messages);
                commit('SET_UNREAD_COUNT', data.total);
            }
        },

        async fetchContacts({commit, state, dispatch}) {
            commit('SET_LOADING_CONTACTS', true);
            cancelCTSource.cancel('abort');
            cancelCTSource = axios.CancelToken.source();

            const data = await axiosGet('/messenger/contacts?page=' + state.contacts_page + '&q=' + state.searchQuery, {
                cancelToken: cancelCTSource.token,
            });
            if (data) {
                if (data.length > 0) {
                    if (state.contacts_page > 1) {
                        commit('ADD_CONTACTS', data);
                    } else {
                        commit('SET_CONTACTS', data);
                    }
                } else {
                    commit('SET_MORE_CONTACTS', false);
                }

            } else {
                //toast.error('Произошла ошибка! Обновите страницу.');
            }
            commit('SET_LOADING_CONTACTS', false);
        },
        async moreContacts({commit, state, dispatch}) {
            if (state.loading_contacts || !state.has_more_contacts) return;
            commit('SET_CONTACTS_PAGE', state.contacts_page + 1);
            await dispatch('fetchContacts');
        },
        async changeUser({commit, dispatch}, user) {
            //cancelTokenSource.cancel('abort');
            //console.log(cancelTokenSource);
            commit('SET_MESSAGES', []);
            commit('SET_MESSAGES_CURRENT_PAGE', 1);
            commit('SET_MESSAGES_LAST_PAGE', 1);
            commit('SET_SELECTED_USER', user);
            localStorage.setItem('MESSENGER_SELECTED_USER_ID', user.id);
            await dispatch('fetchMessages');
            await dispatch('fetchVacancies');
        },
        async fetchMessages({commit, dispatch, state}) {
            commit('SET_LOADING_MESSAGES', true);
            cancelTokenSource.cancel('abort');
            cancelTokenSource = axios.CancelToken.source();

            const result = await axiosGet(`/messenger/${state.selectedUser.id}/fetch-messages?page=${state.messages_current_page}`, {
                cancelToken: cancelTokenSource.token,
            });
            if (result) {
                commit('SET_MESSAGES_LAST_PAGE', result.last_page);
                let mes_array;
                if (state.messages_current_page > 1) {
                    mes_array = state.messages.concat(result.data);
                } else {
                    mes_array = result.data;
                }
                commit('SET_MESSAGES', mes_array);

                dispatch('seen');
            }
            commit('SET_LOADING_MESSAGES', false);
        },
        async sendMessage({commit, state, dispatch}, message) {
            commit('SET_SENDING_REQUEST', true);
            const data = new FormData();
            const token = Date.now().toString();
            if (state.currentUser.type === 'admin' || state.currentUser.type === 'support') {
                message.from_id = state.supportUser.id;
                message.from_user = state.supportUser;
            } else {
                message.from_id = state.currentUser.id;
                message.from_user = state.currentUser;
            }

            message.token = token;
            message.date = moment().format('DD.MM.YYYY');
            message.created_at = moment().toISOString();
            message.seen = false;

            data.append('to_id', message.to_id);
            data.append('type', message.type);
            data.append('token', message.token);

            if (message.body.length) {
                data.append('body', message.body);
            }
            if (message.file !== null) {
                data.append('file', message.file);
                message.attachment = {
                    title: message.file.name
                }
            }
            if (message.data) {
                data.append('data', JSON.stringify(message.data));
            }

            commit('MESSAGE_SEND', message);

            const result = await axiosPost(`/messenger/${state.selectedUser.id}/send-message`, data, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            });

            if (result) {
                commit('MESSAGE_SENT', {
                    token: token,
                    message: result
                });
            } else {
                commit('MESSAGE_ERROR', {
                    token: token,
                });
            }
            commit('SET_FILE_UPLOAD', {file: null});
            commit('SET_SENDING_REQUEST', false);
        },
        async messageReceived({commit, state, dispatch}, message) {
            commit('MESSAGE_RECEIVE', message);
        },
        async messagesSeen({commit}, data) {
            commit('MESSAGES_SEEN', data);
        },
        async dataOpened({commit}, data) {
            commit('DATA_OPENED', data);
        },
        async seen({commit, state}, payload = {}) {
            let user_id = payload.user_id || 0;
            let last_id = payload.last_id || 0;

            if (user_id === 0) {
                user_id = state.selectedUser.id;
            }
            if (last_id === 0 && state.messages.length) {
                last_id = state.messages[0].id;
            }
            const result = await axiosPost(`/messenger/${user_id}/seen-message`, {last_id: last_id || 0});
            if (result) {
                commit('MAKE_SEEN');
                commit('SET_UNREAD_COUNT', result.unread);
            }
        },
        toggleSidebar({commit}, open = null) {
            commit('TOGGLE_SIDEBAR', open)
        },
        editMessage({commit}, message) {
            const messageText = stripHtml(br2nl(message.body)).trim();
            commit('SET_SELECTED_MESSAGE', message);
            commit('SET_MESSAGE_TEXT', messageText);
        },
        cancelEditMessage({commit}) {
            commit('SET_SELECTED_MESSAGE', null)
            commit('SET_MESSAGE_TEXT', '')
        },
        async updateMessage({commit}, message) {

            const result = await axiosPatch(`/messenger/update-message`, message);
            if (result) {
                commit('UPDATE_MESSAGE', result);
            }

            commit('SET_SELECTED_MESSAGE', null);
            commit('SET_MESSAGE_TEXT', '');
        },
    }
}
