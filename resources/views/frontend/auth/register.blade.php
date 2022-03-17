@extends('frontend.layout.app')

@section('title', $role === 'candidate' ? __('auth.register-candidate') : __('auth.register-recruiter'))

@section('content')
    <div class="row g-0">
        <div class="col-12 col-lg-6 col-xl-7 col-auth-form mx-auto">
            <div class="auth-form-wrp text-center">
                <div class="main-registration__title">
                    <h4>
                        <span>{{$role == 'recruiter' ?  __('auth.register-recruiter') : __('auth.register-candidate')}}</span>
                    </h4>
                </div>
                @if($role !== 'recruiter')
                    @include('frontend.auth.includes.login-social')
                @endif
                <registration-form action='{{route('frontend.auth.register.store', $role)}}'
                                   role='{{$role}}'
                                   :errors='@json(validation_errors())'
                                   class="mb-3"
                >
                    @csrf
                    @if(config('site-settings.access.captcha.registration'))
                        <input type="hidden" name="captcha_status" value="true"/>
                    @endif
                </registration-form>

                <div class="main-registration__text">
                    <p>
                        @lang('Already have an account?')
                        <a href="{{route('frontend.auth.login')}}">@lang('Sign in')</a>
                    </p>
                    <p><span>@lang('or')</span></p>
                    @if($role === 'candidate')
                        <p>@lang('Are you an employer?')
                            <a href="{{route('frontend.auth.register', 'recruiter')}}">@lang('Sign up')</a>
                        </p>
                    @else
                        <p>@lang('Looking for a job?')
                            <a href="{{route('frontend.auth.register', 'candidate')}}">@lang('Sign up')</a>
                        </p>
                    @endif
                </div>
            </div>
        </div>
    </div>



@endsection
