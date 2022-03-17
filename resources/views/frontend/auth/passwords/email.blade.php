@extends('frontend.layout.app')

@section('title', __('Reset Password'))

@section('content')

    <div class="row g-0">
        <div class="col-12 col-lg-6 col-xl-7 col-auth-form  mx-auto">
            <div class="auth-form-wrp text-center my-100 py-50">
                <div class="main-registration__title">
                    <h4><span>@lang('Reset Password')</span></h4>
                </div>

                <form method="post" class="auth-form" action="{{route('frontend.auth.password.email')}}">
                    @csrf
                    <x-form.text-group class="form-group-bb"
                                       required
                                       label="E-mail"
                                       type="email" name="email"
                                       :value="old('email')"
                                       placeholder="{{__('E-mail Address') }}" />


                    <button class="btn btn-primary btn-lg rounded-pill btn-block w-100" type="submit">@lang('Send Password Reset Link')</button>
                </form>
            </div>
        </div>
    </div>

@endsection
