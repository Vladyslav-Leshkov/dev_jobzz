@extends('frontend.layout.app')

@section('title', __('Invoice Order'))


@section('content')
{{--    <x-page.head class="mb-30 mb-lg-50">@lang('Invoice Order')</x-page.head>--}}

<form class="container py-60 py-lg-100"
      v-is="'recruiter-invoice-form'"
      action="{{route('frontend.profile.payment.invoice')}}"
      :candidates='@json($items)'
      :recruiter='@json($recruiter)'
      :card-address='@json($card_address)'
      :swift-address='@json($swift_address)'
      :invoice-address='@json($invoice_address)'
      :options='@json($options)'
    >
        @csrf

    </form>
@endsection
