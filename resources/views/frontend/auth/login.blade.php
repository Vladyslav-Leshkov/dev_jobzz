@extends('frontend.layout.app')

@section('title', __('Login'))

@section('content')
    <div class="row g-0">
        <div class="col-12 col-lg-6 col-xl-7 col-auth-form mx-auto">
            <div class="auth-form-wrp text-center">
                <div class="main-registration__title">
                    <h4><span>@lang('Sign in')</span></h4>
                </div>

                @include('frontend.auth.includes.login-social')
                <auth-form action='{{route('frontend.auth.login.store')}}'
                           reset-url='{{route('frontend.auth.password.request')}}'
                           :errors='@json(validation_errors())'
                           class="mb-45"
                >
                    @csrf

                    @if(config('site-settings.access.captcha.login'))
                        <input type="hidden" name="captcha_status" value="true"/>
                    @endif
                </auth-form>

                <div class="main-registration__text px-15">
                    <p>
                        <span class="font-19 fw-500 d-block text-dark mb-15">@lang('Don\'t have an account?')</span>
                        <a class="btn btn-reg btn-lg w-80 rounded-pill mx-auto"
                           href="{{route('frontend.auth.register', 'candidate' )}}">@lang('auth.register-candidate')</a>
                        <span class="d-block font-15 my-8">или</span>
                        <a class="btn btn-reg btn-lg w-80 rounded-pill mx-auto"
                           href="{{route('frontend.auth.register', 'recruiter' )}}">@lang('auth.register-recruiter')</a>
                    </p>
                </div>
            </div>
        </div>
    </div>

@endsection
