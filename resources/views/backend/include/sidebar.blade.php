<nav id="sidebar" class="sidebar">
    <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="{{ url('/admin') }}">
            <span class="align-middle">{{ config('app.name', 'Laravel') }} CMS</span>
        </a>
        <div data-simplebar>
            <ul class="sidebar-nav">
                <li class="sidebar-header">
                    @lang('Home')
                </li>
                <li class="sidebar-item {{routeActiveClass('admin.dashboard.*')}}">
                    <a class="sidebar-link" href="{{route('admin.dashboard')}}">
                        <i class="align-middle" data-feather="sliders"></i> <span
                                class="align-middle">@lang('Dashboard')</span>
                    </a>
                </li>
                <li class="sidebar-header">
                    @lang('Access')
                </li>
                <li class="sidebar-item {{routeActiveClass('admin.user.*')}}">
                    <a href="#auth" data-bs-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="users"></i> <span
                                class="align-middle">@lang('Users')</span>
                    </a>
                    <ul id="auth" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                        <li class="sidebar-item"><a class="sidebar-link"
                                                    href="{{route('admin.user.index')}}">@lang('Users List')</a></li>
                        <li class="sidebar-item"><a class="sidebar-link"
                                                    href="{{route('admin.user.create')}}">@lang('Create User')</a></li>

                    </ul>
                </li>
                {{--            <li class="sidebar-item">--}}
                {{--                <a href="#roles" data-bs-toggle="collapse" class="sidebar-link collapsed">--}}
                {{--                    <i class="align-middle" data-feather="key"></i> <span class="align-middle">@lang('Roles')</span>--}}
                {{--                </a>--}}
                {{--                <ul id="roles" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">--}}
                {{--                    <li class="sidebar-item"><a class="sidebar-link" href="{{route('admin.role.index')}}">@lang('Roles List')</a></li>--}}
                {{--                    <li class="sidebar-item"><a class="sidebar-link" href="{{route('admin.role.create')}}">@lang('Create Role')</a></li>--}}

                {{--                </ul>--}}
                {{--            </li>--}}
                <li class="sidebar-header">
                    @lang('Jobzz')
                </li>
                <li class="sidebar-item {{routeActiveClass('admin.candidate.*')}}">
                    <a class="sidebar-link "
                       href="{{route('admin.candidate.index')}}">
                        <i class="align-middle" data-feather="users"></i> @lang('Candidates')
                        <span v-is="'can-mod-badge'" :count='{{$moderate_candidate_count}}'></span>
                    </a>
                </li>
                <li class="sidebar-item {{routeActiveClass('admin.recruiter.*')}}">
                    <a class="sidebar-link" href="{{route('admin.recruiter.index')}}">
                        <i class="align-middle" data-feather="users"></i> @lang('Recruiters')
                        <span v-is="'rec-mod-badge'" :count='{{$moderate_recruiter_count}}'></span>
                        @if($late_payouts_count > 0)
                            <span class="badge bg-danger text-dark ms-5"
                                  title="Просроченные оплаты">{{$late_payouts_count}}</span>
                        @endif
                    </a>
                </li>
                <li class="sidebar-item {{routeActiveClass('admin.company.*')}}">
                    <a class="sidebar-link" href="{{route('admin.company.index')}}">
                        <i class="align-middle" data-feather="briefcase"></i> @lang('Companies')
                    </a>
                </li>
                <li class="sidebar-item {{routeActiveClass('admin.vacancy.*')}}">
                    <a class="sidebar-link" href="{{route('admin.vacancy.index')}}">
                        <i class="align-middle" data-feather="user-plus"></i> @lang('Vacancies')
                    </a>
                </li>
                <li class="sidebar-item {{routeActiveClass('admin.specialization.*')}}">
                    <a class="sidebar-link" href="{{route('admin.specialization.index')}}">
                        <i class="align-middle" data-feather="server"></i> @lang('Specialization')
                    </a>
                </li>
                <li class="sidebar-item {{routeActiveClass('admin.skill.*')}}">
                    <a class="sidebar-link" href="{{route('admin.skill.index')}}">
                        <i class="align-middle" data-feather="hash"></i> @lang('Skills')
                    </a>
                </li>
                <li class="sidebar-item {{routeActiveClass('admin.messenger.*')}}">
                    <a class="sidebar-link" href="{{route('admin.messenger.index')}}">
                        <i class="align-middle" data-feather="message-circle"></i> @lang('Messenger')
                        <span v-is="'msg-badge'"></span>
                    </a>
                </li>
                <li class="sidebar-item {{routeActiveClass('admin.invoice.*')}}">
                    <a class="sidebar-link" href="{{route('admin.invoice.index')}}">
                        <i class="align-middle" data-feather="file-text"></i> @lang('Invoices')
                        @if($late_payouts_count > 0)
                            <span class="badge bg-danger text-dark ms-5"
                                  title="Просроченные оплаты">{{$late_payouts_count}}</span>
                        @endif
                    </a>
                </li>
                @if(current_user()->isAdmin())
                    <li class="sidebar-header">
                        @lang('Site content')
                    </li>
                    <li class="sidebar-item {{routeActiveClass('admin.page.*')}}">
                        <a href="{{route('admin.page.index')}}" class="sidebar-link">
                            <i class="align-middle" data-feather="file-text"></i>
                            <span class="align-middle">@lang('Site pages')</span>
                        </a>
                    </li>
                    <li class="sidebar-item {{routeActiveClass('admin.menus.*')}}">
                        <a href="{{route('admin.menus.index')}}" class="sidebar-link">
                            <i class="align-middle" data-feather="file-text"></i>
                            <span class="align-middle">@lang('Site menus')</span>
                        </a>
                    </li>
                    <li class="sidebar-item {{routeActiveClass('admin.html-block.*')}}">
                        <a href="{{route('admin.html-block.index')}}" class="sidebar-link">
                            <i class="align-middle" data-feather="code"></i>
                            <span class="align-middle">@lang('Html Blocks')</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.translation.index')}}">
                            <i class="align-middle" data-feather="feather"></i> <span
                                    class="align-middle">@lang('Translations')</span>
                        </a>
                    </li>
                    <li class="sidebar-header">
                        @lang('System')
                    </li>

                    <li class="sidebar-item">
                        <a class="sidebar-link" href="{{route('admin.site-options.index')}}">
                            <i class="align-middle" data-feather="settings"></i> <span
                                    class="align-middle">@lang('Global settings')</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#logs" data-bs-toggle="collapse" class="sidebar-link collapsed">
                            <i class="align-middle" data-feather="list"></i> <span
                                    class="align-middle">@lang('Server Logs')</span>
                        </a>
                        <ul id="logs" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="{{route('log-viewer::dashboard')}}">@lang('Dashboard')</a>
                            </li>
                            <li class="sidebar-item">
                                <a class="sidebar-link" href="{{route('log-viewer::logs.list')}}">@lang('Logs')</a>
                            </li>
                        </ul>
                    </li>
                @endif
            </ul>
            <div class="sidebar-cta">
                <div class="sidebar-cta-content">
                    {{--                <strong class="d-inline-block mb-2">Upgrade to Pro</strong>--}}
                    {{--                <div class="mb-3 text-sm">--}}
                    {{--                    Are you looking for more components? Check out our premium version.--}}
                    {{--                </div>--}}
                    {{--                <div class="d-grid">--}}
                    {{--                    <a href="upgrade-to-pro.html" class="btn btn-primary">Upgrade to Pro</a>--}}
                    {{--                </div>--}}
                </div>
            </div>
        </div>


    </div>
</nav>
