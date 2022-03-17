@extends('frontend.layout.app')

@section('title', __('Verify Your E-mail Address'))

@section('content')
    {{--    <x-page.head class="mb-30 mb-lg-50">@lang('Verify Your E-mail Address')</x-page.head>--}}
    <div class="container py-100 py-md-200 py-lg-300">
        <div class="mb-30 text-center">
            @lang('Before proceeding, please check your email for a verification link.')

        </div>

        <x-forms.post :action="route('frontend.auth.verification.send')" class="d-block text-center">
            <button class="btn btn-lg btn-primary rounded-pill" type="submit">@lang('Resend confirmation link')</button>
        </x-forms.post>
    </div>

@endsection

