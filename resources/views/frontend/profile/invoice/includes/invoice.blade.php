<div class="page">
    <table class="bd pd w-100 mb-30">
        <tr>
            <td class="bd-r">{{site_option('invoice_bank_rub')}}</td>
            <td class="bd-b bd-r">БИК</td>
            <td>{{site_option('invoice_bank_bik_rub')}}</td>
        </tr>
        <tr>
            <td class="bd-b bd-r">Банк получателя</td>
            <td class="bd-b bd-r">Сч. №</td>
            <td class="bd-b">{{site_option('invoice_bank_account_rub')}}</td>
        </tr>
        <tr>
            <td class="bd-b bd-r"><b>ИНН {{site_option('invoice_inn_rub')}}</b></td>
            <td class="bd-r">Сч. №</td>
            <td><b>{{site_option('beneficiary_account_rub')}}</b></td>
        </tr>
        <tr>
            <td class="bd-r"><b>{{site_option('invoice_name_rub')}}</b> <br><br>Получатель</td>
            <td class="bd-r"></td>
            <td></td>
        </tr>
    </table>

    <h2 class="bd-b bw-2 w-100 mb-30">Счет на оплату № {{$invoice->invoice_no}}
        от {{$invoice->created_at->format('d.m.Y г.')}}</h2>

    <table class="mb-30">
        <tr>
            <td class="pr-10 pb-10">Поставщик:</td>
            <th class="pb-10">
                {{site_option('invoice_name_rub')}}, ИНН {{site_option('invoice_inn_rub')}}
                , {{site_option('invoice_address_rub')}}
            </th>
        </tr>
        <tr>
            <td class="pr-10">Покупатель</td>
            <th>{{$invoice->payment_info['payer']['name']}}, ИНН {{$invoice->payment_info['payer']['inn']}}</th>
        </tr>
    </table>

    <table class="bordered pd w-100 mb-10">
        <tr class="ta-c">
            <th>№</th>
            <th>Товары (работы, услуги)</th>
            <th>кол-во</th>
            <th>Ед.</th>
            <th>НДС</th>
            <th>Цена</th>
            <th>Сумма</th>
        </tr>
        @if(isset($invoice->payment_info['items']))
            @foreach($invoice->payment_info['items'] as $key=>$item)
                <tr>
                    <td>{{$key + 1}}</td>
                    <td>{{site_option('invoice_offer_rub')}} #{{$item['candidate_id'] ?? 0}}</td>
                    <td class="ta-c">1</td>
                    <td class="ta-c">шт</td>
                    <td class="tnw ta-c">Без НДС</td>
                    <td class="ta-r tnw">{{number_format($item['amount'], 2, ',', ' ')}}</td>
                    <td class="ta-r tnw">{{number_format($item['amount'], 2, ',', ' ')}}</td>
                </tr>
            @endforeach
        @else
            @foreach($invoice->payouts as $key=>$item)
                <tr>
                    <td>{{$key + 1}}</td>
                    <td>{{site_option('invoice_offer_rub')}} #{{$item->candidate_id}}</td>
                    <td class="ta-c">1</td>
                    <td class="ta-c">шт</td>
                    <td class="tnw ta-c">Без НДС</td>
                    <td class="ta-r tnw">{{number_format($item->amount, 2, ',', ' ')}}</td>
                    <td class="ta-r tnw">{{number_format($item->amount, 2, ',', ' ')}}</td>
                </tr>
            @endforeach
        @endif
    </table>
    <table class="w-100 mb-30">
        <tr>
            <td>Всего наименований на сумму {{number_format($invoice->amount, 2, ',', ' ')}} руб.</td>
            <th class="ta-r">Итого к оплате:</th>
            <th class="ta-r pr-10 tnw">{{number_format($invoice->amount, 2, ',', ' ')}}</th>
        </tr>
        <tr>
            <th colspan="3" class="pt-10 tnw">
                {{Str::ucfirst(number2string($invoice->amount))}} рублей
            </th>
        </tr>
    </table>
    <div class="bd-b bw-2 mb-60">&nbsp;</div>
    <table class="w-100">

        <tr>
            <th class="tnw">
                <img src="{{public_path('img/sign.png')}}" alt="sign" style="margin-left: 50px; height: 100px">
                <div style="margin-top: -75px;">ИП&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Лешков&nbsp;В.А.
                </div>
            </th>
            <th class="tnw">

            </th>
        </tr>
    </table>
</div>
