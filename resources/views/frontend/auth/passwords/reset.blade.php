@extends('frontend.layout.app')

@section('title', __('Reset Password'))

@section('content')

    <div class="row g-0">
        <div class="col-12 col-lg-6 col-xl-7 col-auth-form  mx-auto">
            <div class="auth-form-wrp text-center my-50">
                <div class="main-registration__title">
                    <h4><span>@lang('Reset Password')</span></h4>
                </div>

                <form method="post" class="auth-form" action="{{route('frontend.auth.password.update')}}">
                    @csrf
                    <input type="hidden" name="token" value="{{ $token }}" />
                    <x-form.text-group class="form-group-bb"
                                       required
                                       label="E-mail"
                                       type="email"
                                       name="email"
                                       :value="$email ?? old('email')"
                                       placeholder="{{__('E-mail Address') }}" />

                    <x-form.text-group class="form-group-bb"
                                       required
                                       :label="__('Password')"
                                       type="password"
                                       name="password"
                                       :placeholder="__('Password')" />

                    <x-form.text-group class="form-group-bb"
                                       required
                                       :label="__('Password Confirmation')"
                                       type="password"
                                       name="password_confirmation"
                                       :placeholder="__('Password Confirmation')" />

                    <button class="btn btn-primary btn-lg rounded-pill btn-block w-100" type="submit">@lang('Reset Password')</button>
                </form>
            </div>
        </div>
    </div>

@endsection
