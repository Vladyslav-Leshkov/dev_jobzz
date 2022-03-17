<div class="page fs-14 pt-10">
    <div class="ta-c fw-bold fs-16">Invoice No.: {{$invoice->invoice_no}}</div>
    <div class="ta-c fw-bold mb-60 fs-16">Invoice date: {{$invoice->created_at->format('d.m.Y')}}</div>


    <div class="fw-bold">Invoice to:</div>
    <div>{{$invoice->payment_info['payer']['name']}}</div>
    <div>
        Address: {{$invoice->payment_info['payer']['postcode']}},
        {{$invoice->payment_info['payer']['country']}},
        {{$invoice->payment_info['payer']['street_address1']}}
    </div>
    <div>{{$invoice->payment_info['payer']['eu_vat_id']}}</div>
    <br>
    <br>

    <div class="fw-bold">Pay to:</div>
    <div>Beneficiary’s name: <b>{{Str::upper(site_option('beneficiary'))}}</b></div>
    <div>ITN: <b>{{site_option('invoice_inn_rub')}}</b></div>
    <div>Beneficiary’s address: <b>{{Str::upper(site_option('beneficiary_address'))}}</b></div>
    <div>Beneficiary’s account: <b>{{site_option('beneficiary_account_'.Str::lower($invoice->currency))}}</b></div>
    <div>Beneficiary's bank address: <b>{{Str::upper(site_option('beneficiary_bank_address'))}}</b></div>
    <div class="mb-30">
        Intermediary SWIFT:
        <b>{{site_option('intermediary_swift_'.Str::lower($invoice->currency))}}</b>
    </div>

    <div class="fw-bold">Notes:</div>
    <div class="mb-30">
        All charges of correspondent banks are at the Supplier’s expenses. Please note, that payment
        according to this invoice at the same time is the confirmation of performed works, delivered
        services and final mutual installments between Parties without any additional documents. Also
        it is to acknowledge that Parties have no claims to each other.
    </div>

    <table class="w-100 mb-30">
        <tr>
            <th>Description</th>
            <th class="ta-c">Quantity</th>
            <th class="ta-r">Price</th>
            <th class="ta-r">Amount</th>
        </tr>
        @if(isset($invoice->payment_info['items']))
            @foreach($invoice->payment_info['items'] as $key=>$item)
                <tr>
                    <th>{{site_option('invoice_offer_swift')}} #{{$item['candidate_id'] ?? 0}}</th>
                    <td class="ta-c">1</td>
                    <td class="ta-r">{!!numfmt_currency(convert_currency($item['amount'], $invoice->currency, $item['currency']) , $invoice->currency)!!}</td>
                    <td class="ta-r">{!!numfmt_currency(convert_currency($item['amount'], $invoice->currency, $item['currency']) , $invoice->currency)!!}</td>
                </tr>
            @endforeach
        @else
            @foreach($invoice->payouts as $key=>$item)
                <tr>
                    <th>{{site_option('invoice_offer_swift')}} #{{$item->candidate_id}}</th>
                    <td class="ta-c">1</td>
                    <td class="ta-r">{!! numfmt_currency(convert_currency($item->amount, $invoice->currency, $item->currency) , $invoice->currency)!!}</td>
                    <td class="ta-r">{!! numfmt_currency(convert_currency($item->amount, $invoice->currency, $item->currency) , $invoice->currency)!!}</td>
                </tr>
            @endforeach
        @endif

        <tr>
            <td colspan="2" class="pt-10"></td>
            <td colspan="2" class="ta-r pt-10">
                Subtotal: {!! numfmt_currency($invoice->amount, $invoice->currency)!!}
            </td>
        </tr>
        <tr>
            <td colspan="2" class="bd-b pb-10"></td>
            <td colspan="2" class="ta-r bd-b pb-10">VAT: 0.00</td>
        </tr>
        <tr>
            <td class="ta-r pt-10"></td>
            <th colspan="3" class="ta-r pt-10">
                Invoice Total ({{$invoice->currency}}):
                {!! numfmt_currency($invoice->amount, $invoice->currency) !!}
            </th>
        </tr>
    </table>

</div>
