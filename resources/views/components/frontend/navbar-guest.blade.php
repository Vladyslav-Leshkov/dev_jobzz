<header class="header">
    <nav class="navbar navbar-expand-xl navbar-dark navbar-guest">
        <div class="container">
            <div class="d-flex align-items-center">
                <a href="#" class="navbar-toggler sidebar-toggle d-none me-15">
                    <span></span>
                    <span></span>
                    <span></span>
                </a>
                <div class="logo me-35">
                    <a class="navbar-brand p-0 header__logo logo-header" href="/"><img
                                src="{{asset('/images/logo.png')}}" alt=""></a>
                    <a class="logo-text" href="/"><span>{{appName()}}</span></a>
                </div>
            </div>
            <div class="d-flex align-items-center order-xl-last">
                <ul class="navbar-nav flex-row ms-auto mb-lg-0 d-none d-md-flex">
                    @if(auth()->check())
                        <x-utils.menu-logout class="nav-item" link-class="nav-link"
                                             id="logout2-form"></x-utils.menu-logout>
                    @else
                        <li class="nav-item">
                            <a class="nav-link py-0 pe-0 d-flex align-items-center"
                               href="{{route('frontend.auth.login')}}">
                                <span class="me-10">@lang('header.sign-in')</span>
                                <img src="{{asset('/images/no-avatar.svg')}}" class="avatar"/>
                            </a>

                        </li>
                    @endif

                    <x-frontend.lang-toggle/>
                </ul>
                <button class="navbar-toggler ms-20" type="button" data-bs-toggle="collapse"
                        data-bs-target="#header-collapse"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse" id="header-collapse">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 pt-10 pt-xl-0">
                    @foreach($left_side as $menu_item)
                        <li class="nav-item">
                            <a class="nav-link" href="{{$menu_item->slug}}">
                                <span>{{$menu_item->title}}</span>
                            </a>
                        </li>
                    @endforeach
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    @foreach($right_side as $menu_item)
                        <li class="nav-item">
                            <a class="nav-link" href="{{$menu_item->slug}}">
                                <span>{{$menu_item->title}}</span>
                            </a>
                        </li>
                    @endforeach

                    @if(auth()->check())
                        <x-utils.menu-logout></x-utils.menu-logout>
                    @else
                        <li class="nav-item d-xl-none">
                            <a class="nav-link" href="{{route('frontend.auth.login')}}">@lang('header.sign-in')</a>
                        </li>
                    @endif

                </ul>
            </div>
        </div>
    </nav>
</header>

