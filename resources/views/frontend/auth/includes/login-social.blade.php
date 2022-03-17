<div class="main-registration__buttons btn-registration">
    <div class="btn-registration__items">
        <a href="{{route('frontend.auth.social.login', ['provider'=>'linkedin', 'role'=> $role ?? ''])}}"
           class="btn-registration__item">
            <img src="/images/icons/linkedin.svg" alt="">
            <span>LinkedIn</span>
        </a>
        <a href="{{route('frontend.auth.social.login',  ['provider'=>'google', 'role'=> $role ?? ''])}}"
           class="btn-registration__item">
            <img src="/images/icons/google.svg" alt="">
            <span>Google</span>
        </a>
    </div>
    <div class="btn-registration__or">@lang('or')</div>
    <div class="btn-registration__items">
        <a href="{{route('frontend.auth.social.login', ['provider'=>'facebook', 'role'=> $role ?? ''])}}"
           class="btn-registration__item">
            <img src="/images/icons/facebook.svg" alt="">
            <span>Facebook</span>
        </a>
        <a href="{{route('frontend.auth.social.login', ['provider'=>'github', 'role'=> $role ?? ''])}}"
           class="btn-registration__item">
            <img src="/images/icons/github.svg" alt="">
            <span>GitHub</span>
        </a>
    </div>
</div>
