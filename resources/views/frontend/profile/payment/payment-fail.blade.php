@extends('frontend.layout.app')

@section('title', __('payment.title'))


@section('content')
{{--    <x-page.head class="mb-30 mb-lg-50">{{__('payment.title')}}</x-page.head>--}}

<div class="container py-100 py-lg-200 text-center">
    <div class="mt-50">

        <div class="page-title mb-20">{{$message}}</div>
            <div> @lang('An error occurred while making a payment. Please try later or another way.')</div>
        </div>
    </div>
@endsection
