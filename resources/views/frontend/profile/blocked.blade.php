@extends('frontend.layout.app')

@section('title', __('Account Blocked'))


@section('content')

    <div class="container py-150">
        <div class="page-title text-center mb-50 mb-lg-100">@lang('Your account has been blocked')</div>

        <div class="d-flex">
            <div class="mx-auto">
                <a href="{{route('frontend.profile.payment.index')}}"
                   class="btn btn-lg mb-30 btn-primary rounded-pill w-100">@lang('Go to the payment')</a>
                <a href="{{route('frontend.messenger.index')}}"
                   class="btn btn-lg btn-outline-primary rounded-pill w-100">@lang('Contact support')</a>
            </div>
        </div>

    </div>



@endsection
