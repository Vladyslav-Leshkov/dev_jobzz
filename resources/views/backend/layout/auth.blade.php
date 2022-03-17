<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title', config('app.name', 'Laravel'))</title>

    <link rel="icon" type="image/png" href="{{asset('images/favicon.png')}}"/>
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    @stack('before-styles', false)
    <link href="{{ mix('css/admin.css') }}" rel="stylesheet">
    @stack('after-styles', false)
</head>
<body>
<main class="d-flex w-100" id="app">
    <div class="container d-flex flex-column">
        <div class="row vh-100">
            <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
                <div class="d-table-cell align-middle">
                    @include('backend.include.messages')

                    @yield('content')
                </div>
            </div>
        </div>
    </div>
</main>
<!-- Scripts -->
@stack('before-scripts', false)
<script src="{{ mix('js/manifest.js') }}" defer></script>
<script src="{{ mix('js/vendor.js') }}" defer></script>
<script src="{{ mix('js/admin.js') }}" defer></script>
@stack('after-scripts', false)
</body>
</html>

