<template>
    <form :action="action" class="invoice-form" method="POST">
        <div class="mw-840">
            <slot/>
            <div class="mb-40">
                <div class="page-title mb-30">{{ __('Select a Payment Method') }}</div>
                <template
                    v-for="method in options.payment_methods"
                    :key="'pmt-'+method.slug"
                >
                    <form-radio

                        v-model="paymentMethod"
                        :value="method.slug"
                        name="payment_method"
                    >
                        {{ method.title }}
                    </form-radio>

                    <div v-if="method.slug === 'swift' && formData.payment_method === 'swift'" class="ps-30 mb-5">
                        <form-radio
                            v-for="currency in swiftCurrencies"
                            v-model="paymentCurrency"
                            :value="currency.iso"
                            name="currency"
                        >
                            {{ currency.iso }}
                        </form-radio>
                    </div>
                </template>

            </div>
            <div class="mb-40">
                <div class="page-title mb-30">{{ __('Candidates') }}</div>

                <candidate-invoice-row
                    v-for="candidate in candidates"
                    :key="'it'+candidate.id"
                    :currency="currentCurrency"
                    :item="candidate"
                />

                <div class="invoice-total mt-30">
                    <span>{{ __('Total:') }}</span>
                    <b>{{ total }}</b>
                </div>

            </div>
            <div class="mb-30">
                <transition-group name="fade">
                    <invoice-card-address
                        v-if="paymentMethod === 'card'"
                        key="invoice-card-address"
                        v-model="formData.card_address"
                    ></invoice-card-address>

                    <invoice-swift-form
                        v-if="paymentMethod === 'swift'"
                        key="invoice-swift-form"
                        v-model="formData.swift_address"
                        :countries="options.countries"
                    ></invoice-swift-form>

                    <invoice-payer-form
                        v-if="paymentMethod === 'invoice'"
                        key="invoice-payer-form"
                        v-model="formData.invoice_payer"
                    ></invoice-payer-form>
                </transition-group>

            </div>
            <hr>

            <div class="wizard-btns">
                <a class="wizard-back" href="/profile/payment">
                    <span class="btn btn-lg btn-outline-secondary btn-back">
                        <svg-icon icon="arrow-left" size="15"/>
                    </span>
                    <span class="ms-10">{{ __('Back') }}</span>
                </a>

                <div class="wizard-btns-right">
                    <button class="btn btn-lg btn-primary ms-15 btn-publish" type="submit">
                        <span v-if="paymentMethod === 'card'">{{ __('Pay by card') }}</span>
                        <span v-if="paymentMethod === 'swift'">{{ __('Download invoice') }}</span>
                        <span v-if="paymentMethod === 'invoice'">{{ __('Create invoice') }}</span>
                        <svg-icon class="ms-60" icon="arrow-right" size="15"/>
                    </button>
                </div>
            </div>
        </div>

    </form>
</template>

<script>
import {computed, reactive} from "vue";
import FormRadio from "../form/FormRadio";
import CandidateInvoiceRow from "../candidate/CandidateInvoiceRow";
import {convertCurrency, toAmount} from "../../../utils/number";
import InvoiceCardAddress from "./InvoiceCardAddress";
import SvgIcon from "../svg/SvgIcon";
import InvoiceSwiftForm from "./InvoiceSwiftForm";
import InvoicePayerForm from "./InvoicePayerForm";
import {useI18nLocal} from "../../store/composables/useI18nLocal";

export default {
    name: "RecruiterInvoiceForm",
    components: {InvoicePayerForm, InvoiceSwiftForm, SvgIcon, InvoiceCardAddress, CandidateInvoiceRow, FormRadio},
    props: {
        action: String,
        candidates: Array,
        options: {
            type: Object,
            default() {
                return {
                    countries: [],
                    currencies: [],
                    payment_methods: [],
                }
            }
        },
        recruiter: Object,
        cardAddress: Object,
        swiftAddress: Object,
        invoiceAddress: Object,
    },
    setup(props) {


        const cardAddress = reactive({
            name: '', //props.cardAddress.name,
            street_address1: '', //props.cardAddress.street_address1,
            postcode: '', //props.cardAddress.postcode,
            phone: '', //props.cardAddress.phone,
            email: '', //props.cardAddress.email,
        });

        const swiftAddress = reactive({
            name: '', //props.swiftAddress.name,
            street_address1: '', //props.swiftAddress.street_address1,
            country_id: props.swiftAddress.country_id,
            eu_vat_id: '', //props.swiftAddress.eu_vat_id,
        });

        const invoicePayer = reactive({
            name: '', //props.invoiceAddress.name || '',
            vat_id: '', //props.invoiceAddress.inn || ''
        });

        const formData = reactive({
            payment_method: localStorage.getItem('payment_method') || 'card',
            currency: localStorage.getItem('payment_currency') || 'USD',
            items: props.candidates.map(it => it.id),
            card_address: cardAddress,
            swift_address: swiftAddress,
            invoice_payer: invoicePayer,
        });

        const paymentMethod = computed({
            get() {
                return formData.payment_method;
            },
            set(val) {
                localStorage.setItem('payment_method', val);
                formData.payment_method = val;
            }
        });

        const paymentCurrency = computed({
            get() {
                return formData.currency;
            },
            set(val) {
                localStorage.setItem('payment_currency', val);
                formData.currency = val;
            }
        });

        const currentCurrency = computed(() => {
            let iso_cur = 'RUB';
            if (formData.payment_method === 'swift') {
                iso_cur = formData.currency === iso_cur ? 'USD' : formData.currency;
            }
            const cur = props.options.currencies.find(c => c.iso === iso_cur);

            return cur || props.options.currencies[0];
        });

        const total = computed(() => {
            let amount = 0;
            props.candidates.forEach(it => {
                amount += it.amount;
            });
            return currentCurrency.value.symbol + ' ' + toAmount(convertCurrency(amount, currentCurrency.value.course));
        })

        const swiftCurrencies = computed(() => props.options.currencies.filter(curr => curr.iso !== 'RUB'));

        return {
            formData,
            cardAddress,
            swiftAddress,
            invoicePayer,
            total,
            currentCurrency,
            swiftCurrencies,
            paymentMethod,
            paymentCurrency,
        }
    }
}
</script>

<style scoped>

</style>
