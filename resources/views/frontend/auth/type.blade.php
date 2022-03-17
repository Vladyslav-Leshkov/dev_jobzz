@extends('frontend.layout.app')

@section('title', __('Login'))

@section('content')
    <div class="row g-0">
        <div class="col-12 col-lg-6 col-xl-7 col-auth-form mx-auto">
            <div class="auth-form-wrp text-center">
                <div class="main-registration__title">
                    <h4><span>@lang('Registration')</span></h4>
                </div>

                <form action="{{route('frontend.auth.role.store')}}" method="POST" v-is="'role-form'">
                    @csrf

                </form>
            </div>
        </div>
    </div>

@endsection
