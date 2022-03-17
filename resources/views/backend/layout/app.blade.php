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

    <script src="https://cdn.tiny.cloud/1/{{config('services.tinymce.key')}}/tinymce/5/tinymce.min.js"
            referrerpolicy="origin"></script>

    <!-- Styles -->
    @stack('before-styles', false)
    <livewire:styles/>
    <link href="{{ mix('css/admin.css') }}" rel="stylesheet">
    @stack('after-styles', false)
</head>
<body>

<div class="wrapper" id="app">

    @include('backend.include.sidebar')

    <div class="main">
        @include('backend.include.nav')
        <main class="content {{routeActiveClass('admin.messenger.*', 'p-0')}}">
            <div class="container-fluid p-0">
                @include('backend.include.messages')

                @yield('content')
            </div>
        </main>
        @include('backend.include.footer')
    </div>

@include('backend.include.toast-notifications')
<!-- Scripts -->

</div>
@stack('before-scripts', false)
<livewire:scripts/>
<script src="{{ mix('js/manifest.js') }}" defer></script>
<script src="{{ mix('js/vendor.js') }}" defer></script>
<script src="{{ mix('js/admin.js') }}" defer></script>
<script defer src="https://unpkg.com/alpinejs@3.8.1/dist/cdn.min.js"></script>
@stack('after-scripts', false)
</body>
</html>

