import {axiosGet} from "../../services/api";

export default {
    namespaced: true,
    state: () => ({
        currency: 'RUB',
        amount_to_pay: 0,
        pay_before: '',
        danger: false
    }),
    mutations: {
        UPDATE_STATE(state, data) {
            Object.assign(state, data);
        },
        SET_AMOUNT_TO_PAY(state, value) {
            state.amount_to_pay = value;
        },
        SET_CURRENCY(state, value) {
            state.currency = value;
        },
    },
    actions: {
        async getAmountToPay({commit}) {
            const data = await axiosGet('/api/recruiter/amount-to-pay');
            if (data) {
                commit('UPDATE_STATE', data);
            }
        }
    }
}
