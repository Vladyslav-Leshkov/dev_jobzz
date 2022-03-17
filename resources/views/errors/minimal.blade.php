<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>@yield('title')</title>


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

    <!-- Styles -->
    @stack('before-styles', false)
    <link href="{{ mix('css/app.css') }}" rel="stylesheet">
    @stack('after-styles', false)
</head>
<body class="antialiased">
<div class="wrapper">
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

    <div class="d-flex justify-content-center align-items-center"
         style="min-height: calc(100vh - 232px); background-color: #EFEFEF;">
        <div class="px-10 font-18 text-gray-500 border-r border-gray-400 tracking-wider">
            @yield('code')
        </div>

        <div class="ms-10 font-18 text-gray-500 uppercase tracking-wider">
            @yield('message')
        </div>
    </div>

    <x-frontend.footer/>
</div>
</body>
</html>
