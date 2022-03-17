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
            <td class="bd-b bd-r">ИНН {{site_option('invoice_inn_rub')}}</td>
            <td class="bd-r">Сч. №</td>
            <td>{{site_option('beneficiary_account_rub')}}</td>
        </tr>
        <tr>
            <td class="bd-r">{{site_option('invoice_name_rub')}} <br><br>получатель</td>
            <td class="bd-r"></td>
            <td></td>
        </tr>
    </table>

    <h2 class="bd-b bw-2 w-100 mb-30">Счет на оплату № {{$invoice->tinkoff_no}}
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
                    <td>{{site_option('invoice_offer_rub')}}</td>
                    <td class="ta-c">1</td>
                    <td></td>
                    <td class="tnw">Без НДС</td>
                    <td class="ta-r tnw">{{number_format($item['amount'], 2, ',', ' ')}}</td>
                    <td class="ta-r tnw">{{number_format($item['amount'], 2, ',', ' ')}}</td>
                </tr>
            @endforeach
        @else
            @foreach($invoice->payouts as $key=>$item)
                <tr>
                    <td>{{$key + 1}}</td>
                    <td>{{site_option('invoice_offer_rub')}}</td>
                    <td class="ta-c">1</td>
                    <td></td>
                    <td class="tnw">Без НДС</td>
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
                Руководитель__________________________
            </th>
            <th class="tnw">
                Бухгалтер__________________________
            </th>
        </tr>
    </table>
</div>
