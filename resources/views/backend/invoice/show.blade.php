@extends('backend.layout.app')

@section('title', __('Invoices'))

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.invoice.index'), 'title'=>__('Invoices')],
            ['url'=>route('admin.invoice.show', $invoice), 'title'=>'#'.$invoice->invoice_no],
        ]) !!}
    </div>
    <div class="d-flex justify-content-between">
        <h1>@lang('Invoice') #{{$invoice->invoice_no}}</h1>

        <div></div>
    </div>


    <div class="card" style="max-width: 840px">
        <div class="card-body">
            <h4>Плательщик</h4>
            <div class="mb-50">@include('backend.recruiter.includes.info', ['model'=>$invoice->user])</div>

            <h4>Содержимое</h4>
            <table class="table table-bordered mb-20">
                <thead>
                <tr class="text-center">
                    <th>№</th>
                    <th>Кандидат</th>
                    <th>Цена</th>
                </tr>
                </thead>
                <tbody class="border-bottom-0">

                @if(isset($invoice->payment_info['items']))
                    @foreach($invoice->payment_info['items'] as $key=>$item)
                        <tr>
                            <td>{{$key + 1}}</td>
                            <td>@include('backend.candidate.includes.info', ['model'=>(object)$item['candidate_info']])</td>
                            <td class="text-end">{{convert_currency($item['amount'], $invoice->currency, $item['currency'])}} {{$invoice->currency}}</td>
                        </tr>
                    @endforeach
                @else
                    @foreach($invoice->payouts as $key=>$item)
                        <tr>
                            <td>{{$key + 1}}</td>
                            <td>@include('backend.candidate.includes.info', ['model'=>$item->candidate->user])</td>
                            <td class="text-end">{{convert_currency($item->amount, $invoice->currency, $item->currency)}} {{$invoice->currency}}</td>
                        </tr>
                    @endforeach
                @endif


                </tbody>

            </table>
            <div class="text-end fw-bold pe-10">
                Итого к оплате: {{number_format($invoice->amount, 2, ',', ' ')}} {{$invoice->currency}}
            </div>
        </div>
    </div>

    <div class="card" style="max-width: 840px">
        <div class="card-body">
            @include('frontend.profile.invoice.includes.'.$invoice->payment_method)
        </div>
    </div>
@endsection

@push('after-styles')
    @include('frontend.profile.invoice.includes.styles')
@endpush