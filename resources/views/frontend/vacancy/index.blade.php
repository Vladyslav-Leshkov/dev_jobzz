@extends('frontend.layout.app')

@section('title', $page_title)


@section('content')
    <x-page.s-body class="{{is_candidate() ? 'vacancy-search-page' : ''}}">
        <x-slot name="sidebar">
            @if(is_candidate())
                <a href="/vacancies/my" class="my-vacancies sidebar-subtitle">@lang('Vacancies by my profile')</a>
            @endif
            <div v-is="'vacancy-sidebar'"
                 :options='@json($options)'
                 :spec-item='{{isset($specialization) ? json_encode($specialization) : 'null'}}'
            ></div>
        </x-slot>
        <x-slot name="body">
            <div v-is="'vacancy-search'">
                <h1 class="vacancy-search-title d-none">
                    <span class="badge badge-info me-20">{{$total}}</span>
                    <span>{{str_replace(plural_form($total, [__('вакансия'), __('вакансии'), __('вакансий')]), '', $page_title)}}</span>
                </h1>
            </div>
            <div v-is="'vacancy-list'"
                 :filter='@json((object)request()->except('page'))'
                 :page='{{request('page', 1)}}'>

                @foreach($vacancies as $vacancy)
                    <x-vacancy.card :vacancy="$vacancy" class="profile-card mb-20"></x-vacancy.card>
                @endforeach
            </div>
        </x-slot>
    </x-page.s-body>

@endsection
