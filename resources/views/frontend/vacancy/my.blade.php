@extends('frontend.layout.app')

@section('title', __('Jobs at JOBZZ.RU'))


@section('content')
    <x-page.s-body class="{{is_candidate() ? 'vacancy-search-page' : ''}}">
        <x-slot name="sidebar">
            <div v-is="'vacancy-sidebar'"
                 :options='@json($options)'
            ></div>
        </x-slot>
        <x-slot name="body">
            <div v-is="'vacancy-search'">
                <h1 class="vacancy-search-title d-none">
                    <span class="badge badge-info me-20">{{$total}}</span>
                    <span>{{route('frontend.vacancy.my')}}">{{plural_form($total, [__('вакансия'), __('вакансии'), __('вакансий')])}} {{__('according to my profile')}}</span>
                </h1>
            </div>
            <div v-is="'vacancy-list'" :filter='@json((object)$filter_params)' :page='{{request('page', 1)}}'>
                @foreach($vacancies as $vacancy)
                    <x-vacancy.card :vacancy="$vacancy" class="profile-card mb-20"></x-vacancy.card>
                @endforeach
            </div>
        </x-slot>
    </x-page.s-body>

@endsection
