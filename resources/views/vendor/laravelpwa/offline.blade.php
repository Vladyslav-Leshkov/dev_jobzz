<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{{appName()}} - Offline</title>
    <link rel="icon" type="image/png" href="{{asset('images/favicon.png')}}"/>
    <link rel="stylesheet" href="{{mix('css/app.css')}}">
    <style>
        .offline {
            width: 100vw;
            height: 100vh;
            text-align: center;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "Montserrat", "Roboto", "sans-serif";
        }

        .offline-logo {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="offline">
    <div>
        <img src="/images/logo.png" class="offline-logo" alt="{{appName()}}">
        <div>@lang('You are not connected to the Internet')</div>
        <div>@lang('Вы не подключены к интернету')</div>
    </div>
</div>
</body>
</html>
