@extends('frontend.layout.app')

@section('title', __('payment.title'))


@section('content')
{{--    <x-page.head class="mb-30 mb-lg-50">{{__('payment.title')}}</x-page.head>--}}

<div class="container py-100 py-lg-200 text-center">
    <div class="my-50">
        <div class="page-title">@lang('Thank you for your payment!')</div>
        </div>
    </div>
@endsection
