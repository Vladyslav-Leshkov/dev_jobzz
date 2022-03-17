@extends('backend.layout.auth')

@section('content')

    <div class="text-center mt-4">
        <h1 class="h2">@lang('Sign in')</h1>
        <p class="lead">
            @lang('Sign in to your account to continue')
        </p>
    </div>

    <div class="card">
        <div class="card-body">
            <div class="m-sm-4">

                <form action="{{route('admin.login.store')}}" method="POST">
                    @csrf

                    @if(config('captcha.enabled'))
                        @captcha
                    @endif
                    <div class="mb-3">
                        <label class="form-label">@lang('Email')</label>
                        <input class="form-control form-control-lg" type="email" name="email" placeholder="@lang('Enter your email')" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">@lang('Password')</label>
                        <input class="form-control form-control-lg" type="password" name="password" placeholder="@lang('Enter your password')" />
                    </div>
                    <div>
                        <label class="form-check">
                            <input class="form-check-input" type="checkbox" value="1" name="remember" checked>
                            <span class="form-check-label">
                              @lang('Remember me')
                            </span>
                        </label>
                    </div>
                    <div class="text-center mt-3">
                        <button type="submit" class="btn btn-lg btn-primary">@lang('Sign in')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
