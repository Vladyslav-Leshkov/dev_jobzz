<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title', config('app.name', 'Jobzz.ru'))</title>
    <meta name="keywords" content="@yield('keywords', config('app.name', 'Jobzz.ru'))">
    <meta name="description" content="@yield('description',  config('app.name', 'Jobzz.ru'))">

    <link rel="icon" type="image/png" href="{{asset('images/favicon.png')}}"/>

    <meta property="og:title" content="@yield('title', config('app.name', 'Jobzz.ru'))"/>
    <meta property="og:image" content="{{asset('images/og-logo.jpg')}}"/>
    <meta property="og:image:width" content="1200"/>
    <meta property="og:image:height" content="628"/>
    <!-- Fonts -->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,500;0,600;1,400;1,500;1,600&display=swap"
            rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
            rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&display=swap"
            rel="stylesheet">

    @laravelPWA

    <!-- Styles -->
    @stack('before-styles', false)
    <link href="{{ mix('css/app.css') }}" rel="stylesheet">
    @stack('after-styles', false)
</head>
<body>
<div class="wrapper" id="app">
    @if(auth()->guest())
        <x-frontend.navbar-guest/>
    @else
        @if(current_user()->isRecruiter())
            <x-frontend.navbar-recruiter/>
        @elseif(current_user()->isCandidate())
            <x-frontend.navbar-candidate/>
        @elseif(current_user()->isAdmin() || current_user()->isSupport())
            <x-frontend.navbar-admin/>
        @else
            <x-frontend.navbar-guest/>
        @endif
        <div v-is="'push-questions'"></div>
    @endif

    @yield('content')
    @if(request()->route()->getName() !== 'frontend.messenger.index')
        <x-frontend.footer/>
    @endif

    @include('frontend.include.toast-notifications')
</div>

@stack('before-scripts', false)
<script src="{{ mix('js/manifest.js') }}" defer></script>
<script src="{{ mix('js/vendor.js') }}" defer></script>
<script src="{{ mix('js/app.js') }}" defer></script>
<script>
    var vapidPublicKey = '{{config('webpush.vapid.public_key')}}';
    var pushNotificationsEnabled = {{current_user() && current_user()->isPushNotificationsEnabled() ? 'true' : 'false'}};
</script>
<script src="{{ mix('js/push-notifications.js') }}"></script>
<script type="text/javascript">
    // Initialize the service worker
    if ('serviceWorker' in navigator) {
        navigator.serviceWorker.register('/serviceworker.js', {
            scope: '.'
        }).then(function (registration) {
            // Registration was successful
            console.log('Jobzz PWA: ServiceWorker registration successful with scope: ', registration.scope);
            push_initialiseState();
            initPostMessageListener();
        }, function (err) {
            // registration failed :(
            console.log('Jobzz PWA: ServiceWorker registration failed: ', err);
        });
    }
</script>

@stack('after-scripts', false)
</body>
</html>

