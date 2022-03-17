@extends('frontend.layout.app')

@section('title', __('My Vacancies'))


@section('content')

    <div class="container  mb-50 mb-lg-100 pt-50 pt-lg-100">
        <nav class="nav nav-tabs vacancies-tabs mb-40">
            <a class="nav-link {{activeClass($status == 'active')}}"
               href="{{route('frontend.profile.vacancy.index')}}">{{__('Активные')}}</a>
            <a class="nav-link {{activeClass($status == 'anonymous')}}"
               href="{{route('frontend.profile.vacancy.index', 'anonymous')}}">{{__('Анонимные')}}</a>
            <a class="nav-link {{activeClass($status == 'hold')}}"
               href="{{route('frontend.profile.vacancy.index', 'hold')}}">{{__('Вакансии в холде')}}</a>
            <a class="nav-link last {{activeClass($status == 'archived')}}"
               href="{{route('frontend.profile.vacancy.index', 'archived')}}">{{__('Закрытые вакансии')}}</a>
        </nav>

        @if($status == 'anonymous')
            <h2 class="page-title mb-25">{{__('Анонимные вакансии')}}</h2>
        @elseif($status == 'hold')
            <h2 class="page-title mb-25">{{__('Вакансии в холде')}}</h2>
        @elseif($status == 'archived')
            <h2 class="page-title mb-25">{{__('Закрытые вакансии')}}</h2>
        @else
            <h2 class="page-title mb-25">{{__('Активные вакансии')}}</h2>
        @endif

        @forelse ($vacancies as $vacancy)
            <x-vacancy.item :vacancy="$vacancy" class="mb-15 mw-1020"></x-vacancy.item>
        @empty
            <div class="mb-50">@lang('No Vacancies')</div>
        @endforelse

    </div>
@endsection
