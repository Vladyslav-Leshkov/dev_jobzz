@extends('frontend.layout.app')

@section('title', __('Vacancy').' '.$vacancy->title)


@section('content')
    {{--    <x-page.head class="mb-30 mb-lg-50"><span>@lang('Vacancy') {{$vacancy->title}}</span></x-page.head>--}}
    <div class="container py-50 py-lg-100 {{is_candidate() ? 'vacancy-search-page' : ''}}">
        <x-vacancy.page :vacancy="$vacancy" class="mw-1020">
            @if(auth()->guest())
                <div class="alert alert-secondary px-45 py-25" role="alert">
                    {{__('In order to apply for a vacancy you need')}}
                    <a href="{{route('frontend.auth.login')}}">{{__('Sign in')}}</a>
                    {{__('or')}}
                    <a href="{{route('frontend.auth.register')}}">{{__('Sign up')}}</a>
                </div>
            @elseif(current_user()->isCandidate() && ($vacancy->status === \App\Models\Job\Vacancy::STATUS_ACTIVE || $vacancy->status === \App\Models\Job\Vacancy::STATUS_ANONYMOUS))
                <x-vacancy.offer :vacancy="$vacancy"></x-vacancy.offer>
            @endif
        </x-vacancy.page>
    </div>
@endsection
