<header class="header">
    <nav class="navbar navbar-expand-xl navbar-dark navbar-admin">
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
                <a class="logo me-35" href="/">
                    <span class="navbar-brand p-0 header__logo logo-header"><img src="{{asset('/images/logo.png')}}"
                                                                                 alt=""></span>
                    <span class="logo-text"><span>{{appName()}}</span></span>
                </a>


            </div>
            <div class="d-flex align-items-center order-xl-last">
                <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse"
                        data-bs-target="#header-collapse"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                    <span v-is="'messenger-badge'"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="header-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown vacancy-dropdown">
                        <a class="nav-link dropdown-toggle" href="{{route('frontend.vacancy.index')}}" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <span>@lang('Vacancies')</span>
                        </a>
                        <ul class="dropdown-menu dropdown-header" aria-labelledby="navbarDropdown">
                            @foreach($last_vacancies as $vacancy)
                                <li><a class="dropdown-item" href="{{$vacancy->url}}">{{$vacancy->title}}</a></li>
                            @endforeach
                            <li><a class="dropdown-item all"
                                   href="{{route('frontend.vacancy.index')}}">@lang('View all vacancies')</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown vacancy-dropdown">
                        <a class="nav-link dropdown-toggle" href="{{route('frontend.candidate.index')}}" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <span>@lang('Candidates')</span>
                        </a>
                        <ul class="dropdown-menu dropdown-header" aria-labelledby="navbarDropdown">
                            @foreach($last_candidates as $candidate)
                                <li><a class="dropdown-item" href="{{$candidate->url}}">{{$candidate->position}}</a>
                                </li>
                            @endforeach
                            <li><a class="dropdown-item all"
                                   href="{{route('frontend.candidate.index')}}">@lang('See all candidates')</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="{{route('frontend.messenger.index')}}" :user="{{current_user()}}" class="nav-link"
                           v-is="'messenger-link'"><span>@lang('Messages')</span></a>
                    </li>
                    <li class="nav-item d-xl-none">
                        <a class="nav-link" href="{{route('admin.dashboard')}}">@lang('Administration')</a>
                    </li>
                    <li class="nav-item d-xl-none">
                        <a class="nav-link" href="{{route('admin.user.show', current_user())}}">@lang('My Profile')</a>
                    </li>
                    <li class="nav-item d-xl-none">
                        <a class="nav-link" href="{{route('frontend.profile.settings.index')}}">@lang('Settings')</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0 d-none d-xl-flex">
                    <li class="nav-item dropdown">
                        <a href="#" class="dropdown-toggle text-black" id="dropdownlogo" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            @if(current_user()->has_avatar || empty(current_user()->initials))
                                <img src="{{current_user()->avatar_url}}" class="avatar" alt="">
                            @else
                                <span class="avatar-initials">{{current_user()->initials}}</span>
                            @endif
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownlogo">
                            <li>
                                <a class="dropdown-item" href="{{route('admin.dashboard')}}">@lang('Administration')</a>
                            </li>
                            <li>
                                <a class="dropdown-item"
                                   href="{{route('admin.user.show', current_user())}}">@lang('My Profile')</a>
                            </li>
                            <li>
                                <a class="dropdown-item"
                                   href="{{route('frontend.profile.settings.index')}}">@lang('Settings')</a>
                            </li>

                            <x-utils.menu-logout></x-utils.menu-logout>
                        </ul>
                    </li>
                    <x-frontend.lang-toggle/>
                </ul>
            </div>
        </div>
    </nav>
</header>
