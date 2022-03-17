@extends('frontend.layout.app')

@section('title', __('payment.title'))


@section('content')
{{--    <x-page.head class="mb-30 mb-lg-50">{{__('payment.title')}}</x-page.head>--}}

<div class="container py-100 py-lg-200 text-center">
    <h2 class="page-title mb-50">@lang('Invoice') #{{$invoice->invoice_no}}</h2>

        <a href="{{$invoice->invoice}}" class="btn btn-primary" target="_blank">@lang('Download')</a>

        <div class="my-50">
            @lang('Please indicate in the purpose of payment the information that is indicated in the invoice (numbers too) or inform the support about payment so that we can immediately check it and confirm the payment')
        </div>
    </div>
@endsection
