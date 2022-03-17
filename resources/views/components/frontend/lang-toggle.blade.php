<li class="nav-item language dropdown"
    v-is="'lang-toggle'"
    locale="{{app()->getLocale()}}"
>
    <a href="#" class="dropdown-toggle language-toggle no-caret" id="dropdown-lang" data-bs-toggle="dropdown"
       aria-expanded="false">
        <span class="span-lang">{{config("site-settings.locale.languages")[app()->getLocale()]['short_name']}}</span>
    </a>
    <ul class="dropdown-menu position-absolute dropdown-menu-end dropdown-lang" aria-labelledby="dropdown-lang">
        <li><a class="dropdown-item" href="{{route('frontend.set-locale', 'ru')}}"> <span class="ru">Русский</span> </a>
        </li>
        <li><a class="dropdown-item" href="{{route('frontend.set-locale', 'en')}}"> <span class="us">English</span></a>
        </li>
    </ul>
</li>
