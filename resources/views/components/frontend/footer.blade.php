<footer class="footer">
    <div class="footer__content container">
        <div class="footer__body">
            <div class="footer__item item-footer-up">
                <div class="item-footer-up__logo ">
                    <a href="/">
                        <img src="/images/logo-footer.png" alt="">
                        <span>{{appName()}}</span>
                    </a>
                </div>
                <div class="item-footer-up__buttons buttons-footer">
                    <div class="buttons-footer__item">
                        <a href="{{site_option('google_play')}}">
                            <img src="/images/google-play.png" alt="">
                        </a>
                        <a href="{{site_option('app_store')}}">
                            <img src="/images/app-store.png" alt="">
                        </a>
                    </div>
                    @if(!Auth::check())
                        <a href="{{route('frontend.auth.register')}}" target="_blank">
                            <button type="button" class="btn btn-primary"><span>@lang('Registration')</span></button>
                        </a>
                    @endif
                </div>
            </div>
            <div class="item-footer-middle__buttons buttons-footer">
                <div class="buttons-footer__item2">
                    <a href="{{site_option('google_play')}}">
                        <img src="/images/google-play.png" alt="">
                    </a><a href="{{site_option('app_store')}}">
                        <img src="/images/app-store.png" alt="">
                    </a>
                </div>
            </div>
            <div class="footer__border"></div>

        </div>
        <div class="footer__item item-footer-middle">
            <div class="item-footer-middle__block">
                <div class="item-footer-middle__text font-16 fw-bold">{!! html_block('footer_text')->{'description_'.app()->getLocale()}  !!}</div>

                <div class="item-footer-middle__icons">
                    <a href="{{site_option('linked_in')}}" class="social linkedin me-20" target="_blank">
                        {{svg('linkedin-in-brands')}}
                    </a>
                    <a href="{{site_option('telegram')}}" class="social telegram" target="_blank">
                        {{svg('telegram-plane-brands')}}
                    </a>
                </div>
            </div>
            <div class="footer__menu menu-footer">
                <nav class="menu-footer__item">
                    <div class="menu-footer__title">@lang('Interaction')</div>
                    <ul class="menu-footer__list">
                        <li><a href="{{site_option('telegram')}}" target="_blank"
                               class="menu-footer__link">@lang('I have a suggestion')</a></li>
                        <li><a href="{{site_option('telegram')}}" target="_blank"
                               class="menu-footer__link">@lang('Problems with the site')</a></li>
                        <li><a href="/messenger"
                               class="menu-footer__link">@lang('Need help')</a></li>

                        <li><a href="{{site_option('telegram')}}" target="_blank"
                               class="menu-footer__link">@lang('Found a bug')</a></li>
                    </ul>
                </nav>
                <nav class="menu-footer__item">
                    <div class="menu-footer__title">@lang('Job')</div>
                    <ul class="menu-footer__list list-pd">
                        <li><a href="{{route('frontend.vacancy.index')}}"
                               class="menu-footer__link link-w-600">@lang('Looking for a job')</a></li>
                        <li><a href="{{route('frontend.candidate.index')}}"
                               class="menu-footer__link link-w-600">@lang('I offer a job')</a></li>
                        @if(!Auth::check())
                            <li><a href="{{route('frontend.auth.login')}}"
                                   class="menu-footer__link link-w-600">Войти</a></li>
                        @else
                            <x-utils.menu-logout link-class="menu-footer__link link-w-600"
                                                 id="footer-logout-form"></x-utils.menu-logout>
                        @endif
                    </ul>
                </nav>
                <nav class="menu-footer__item">
                    <div class="menu-footer__title">@lang('Contacts')</div>
                    <ul class="menu-footer__list list-pd">
                        <li><a href="tel:{{clear_phone(site_option('contact_phone1'))}}"
                               class="menu-footer__link link-w-600">{{site_option('contact_phone1')}}</a></li>
                        <li>
                            @if(site_option('contact_phone2'))
                                <a href="tel:{{clear_phone(site_option('contact_phone2'))}}"
                                   class="menu-footer__link link-w-600">{{site_option('contact_phone2')}}</a>
                            @endif
                        </li>
                        <li>
                            @if(site_option('contact_phone3'))
                                <a href="tel:{{clear_phone(site_option('contact_phone3'))}}"
                                   class="menu-footer__link link-w-600">{{site_option('contact_phone3')}}</a>
                            @endif
                        </li>
                        <li><a href="mailto:{{site_option('contact_email')}}"
                               class="menu-footer__link link-w-600">{{site_option('contact_email')}}</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="footer__item item-footer-bottom">
            <div class="item-footer-bottom__data">{{date('Y')}} © {{appName()}}
            </div>
            <div class="item-footer-bottom__politics">
                <a href="{{route('frontend.pages', 'policy')}}">@lang('Privacy Policy')</a>
                <a href="{{route('frontend.pages', 'terms')}}">@lang('Terms of Use')</a>
                <a href="{{site_option('linked_in')}}">@lang('Partnership')</a>
            </div>

            <a href="#"
               class="item-footer-bottom__arrow scroll-to-top {{routeActiveClass('frontend.messenger.*', 'd-none')}}"></a>
        </div>
    </div>
</footer>
