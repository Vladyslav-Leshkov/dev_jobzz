<header class="header">
    <nav class="navbar navbar-expand-xl navbar-dark navbar-recruiter">
        <div class="container">

            <div class="d-flex align-items-center">
                @if(routeActive('frontend.messenger.*'))
                    <a href="#" v-is="'messenger-sb-toggle'"></a>
                @else
                    <a href="#" class="navbar-toggler sidebar-toggle d-none me-15">
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                @endif
                <a class="logo me-15 me-xxl-35" href="{{route('frontend.candidate.index')}}">
                    <span class="navbar-brand p-0 header__logo logo-header"><img src="{{asset('/images/logo.png')}}"
                                                                                 alt=""></span>
                    <span class="logo-text"><span>{{appName()}}</span></span>
                </a>
            </div>
            <div class="d-flex align-items-center order-xl-last">

                <ul class="navbar-nav flex-row ms-auto mb-lg-0 d-none d-md-flex">
                    <li class="nav-item dropdown">
                        <a href="#" class="dropdown-toggle text-black" id="dropdownlogo" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            @if(current_user()->has_avatar || empty(current_user()->initials))
                                <img src="{{current_user()->avatar_url}}" class="avatar" alt="">
                            @else
                                <span class="avatar-initials">{{current_user()->initials}}</span>
                            @endif
                        </a>
                        <ul class="dropdown-menu position-absolute dropdown-menu-end" aria-labelledby="dropdownlogo">
                            <li><a class="dropdown-item"
                                   href="{{route('frontend.profile.index')}}">@lang('header.menu.my-profile')</a></li>
                            <li><a class="dropdown-item disabled" href="#">@lang('header.menu.team')</a></li>
                            <li><a class="dropdown-item"
                                   href="{{route('frontend.profile.payment.index')}}">@lang('header.menu.payment')</a>
                            </li>
                            <li><a class="dropdown-item"
                                   href="{{route('frontend.profile.settings.index')}}">@lang('header.menu.settings')</a>
                            </li>
                            {{--                            <li><a class="dropdown-item disabled" href="#">@lang('Become a candidate')</a></li>--}}
                            <x-utils.menu-logout></x-utils.menu-logout>
                        </ul>
                    </li>
                    <x-frontend.lang-toggle/>
                </ul>
                <button class="navbar-toggler ms-20" type="button" data-bs-toggle="collapse"
                        data-bs-target="#header-collapse"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    <span v-is="'messenger-badge'"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="header-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    @foreach($left_side as $menu_item)
                        <li class="nav-item">
                            @if($menu_item->slug == '/messenger')
                                <a href="{{$menu_item->slug}}" :user="{{current_user()}}" class="nav-link"
                                   v-is="'messenger-link'">
                                    <span>{{$menu_item->title}}</span>
                                </a>
                            @else
                                <a class="{{ $menu_item->button ? 'btn btn-info btn-lg rounded-pill px-50' : 'nav-link' }}"
                                   href="{{$menu_item->slug}}">
                                    <span>{{$menu_item->title}}</span>
                                </a>
                            @endif
                        </li>
                    @endforeach
                    <li class="nav-item d-xl-none">
                        <a class="nav-link"
                           href="{{route('frontend.profile.index')}}">@lang('header.menu.my-profile')</a>
                    </li>
                    <li class="nav-item d-xl-none">
                        <a class="nav-link disabled" href="#">@lang('header.menu.team')</a></li>
                    <li class="nav-item d-xl-none">
                        <a class="nav-link" href="{{route('frontend.profile.payment.index')}}">
                            @lang('header.menu.payment')
                        </a>
                    </li>
                    <li class="nav-item d-xl-none">
                        <a class="nav-link"
                           href="{{route('frontend.profile.settings.index')}}">@lang('header.menu.settings')</a>
                    </li>
                    {{--                    <li class="nav-item d-xl-none">--}}
                    {{--                        <a class="nav-link disabled" href="#">@lang('Become a candidate')</a>--}}
                    {{--                    </li>--}}

                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    @foreach($right_side as $menu_item)
                        <li class="nav-item">
                            @if($menu_item->slug == '/messenger')
                                <a href="{{$menu_item->slug}}" :user="{{current_user()}}" class="nav-link"
                                   v-is="'messenger-link'">
                                    <span>{{$menu_item->title}}</span>
                                </a>
                            @else
                                <a class="{{ $menu_item->button ? 'btn btn-info btn-lg rounded-pill px-50' : 'nav-link' }}"
                                   href="{{$menu_item->slug}}">
                                    <span>{{$menu_item->title}}</span>
                                </a>
                            @endif
                        </li>
                    @endforeach

                    <li class="nav-item">
                        <a href="{{route('frontend.profile.payment.index')}}" v-is="'recruiter-amount-to-pay'"></a>
                    </li>

                    @if(!is_blocked() && !is_moderate())
                        <li class="nav-item">
                            <a href="{{route('frontend.profile.vacancy.index')}}"
                               class="nav-link text-center">@lang('header.my-vacancies')</a>
                        </li>
                        <li class="nav-item me-xl-20 d-inline-flex">
                            <a href="{{route('frontend.profile.vacancy.create')}}"
                               class="btn btn-outline-dark m-auto">@lang('header.create-vacancy')</a>
                        </li>
                    @else
                        <li class="nav-item">
                            <div class="btn btn-status btn-secondary disabled">
                                {{is_moderate() ? __('header.profile-moderation') : __('header.profile-blocked')}}
                            </div>
                        </li>
                    @endif
                    <x-utils.menu-logout class="d-xl-none nav-item" link-class="nav-link"
                                         id="logout-form-sm"></x-utils.menu-logout>
                </ul>
            </div>
        </div>
    </nav>
</header>
