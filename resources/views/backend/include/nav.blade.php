<nav class="navbar navbar-expand navbar-light navbar-bg">
    <a class="sidebar-toggle d-flex">
        <i class="hamburger align-self-center"></i>
    </a>
{{--    <form class="d-none d-sm-inline-block">--}}
{{--        <div class="input-group input-group-navbar">--}}
{{--            <input type="text" class="form-control" placeholder="@lang('Search…')" aria-label="Search">--}}
{{--            <button class="btn" type="button">--}}
{{--                <i class="align-middle" data-feather="search"></i>--}}
{{--            </button>--}}
{{--        </div>--}}
{{--    </form>--}}
    <div class="navbar-collapse collapse">
        <ul class="navbar-nav navbar-align">
            <x-backend.nav-notifications />


            <li v-is="'nav-messages'"></li>

            <li class="nav-item dropdown">
                <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
                    <i class="align-middle" data-feather="settings"></i>
                </a>
                <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                    <img src="{{Auth::user()->avatar_url}}" class="avatar rounded-circle image-cover border-light me-1"  alt="{{ Auth::user()->name }}" />
                    <span class="text-dark">{{ Auth::user()->name }}</span>
                </a>
                <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="{{route('admin.user.show', current_user())}}"><i class="align-middle mr-1" data-feather="user"></i> @lang('Profile')</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="{{ route('admin.logout') }}" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                        <i class="align-middle mr-1" data-feather="log-out"></i>
                        @lang('Logout')</a>
                    <form id="logout-form" action="{{ route('admin.logout') }}" method="POST" class="d-none">
                        @csrf
                    </form>
                </div>
            </li>
        </ul>
    </div>
</nav>
