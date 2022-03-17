@extends('frontend.layout.app')

@section('title', __('Search for candidates'))


@section('content')
    <x-page.s-body>
        <x-slot name="sidebar">
            <candidate-sidebar
                    :options='@json($options)'
            ></candidate-sidebar>
        </x-slot>
        <x-slot name="body">
            <div v-is="'candidate-search'">
                <h1 class="vacancy-search-title d-none">
                    <span class="badge badge-info me-20">{{$total}}</span>
                    <span>{{plural_form($total, [__('кандидат'), __('кандидата'), __('кандидатов')])}} {{__('on')}} Jobzz.ru</span>
                </h1>
            </div>

            <div v-is="'candidate-list'"
                 :filter='@json((object)request()->except('page'))'
                 :page='{{request('page', 1)}}'>
                @foreach($candidates as $candidate)
                    <x-candidate.card :item="$candidate" class="profile-card"></x-candidate.card>
                @endforeach
            </div>
        </x-slot>
    </x-page.s-body>
@endsection
