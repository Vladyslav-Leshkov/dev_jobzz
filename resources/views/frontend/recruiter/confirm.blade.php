@extends('frontend.layout.app')

@section('title', __('We are glad that we helped you find a job'))


@section('content')
    <x-page.head class="mb-30 mb-lg-50"><span>{{__('We are glad that we helped you find a job')}}</span></x-page.head>

    <div class="container  mb-50 mb-lg-100">
        <div class="page-title mb-50">{{__('Indicate which of our employers hired you')}}</div>
        <div class="mw-940" style="min-height: 150px">
            @foreach($offers as $offer)
                <x-vacancy.confirmation :offer="$offer" class="mb-20"/>
            @endforeach
        </div>

    </div>
@endsection
