@extends('frontend.layout.app')

@section('title', __('Company').' '.$company->title)


@section('content')
    {{--    <x-page.head class="mb-30 mb-lg-50"><span>{{__('Company').' '.$company->title}}</span></x-page.head>--}}

    <div class="container my-50 my-lg-100">
        <x-company.page
                :company="$company"
                :vacancies="$vacancies"
        >

            <div class="page-subtitle mb-30">{{__('All company vacancies')}}</div>
            <div class="mw-1020">
                @foreach($vacancies as $vacancy)
                    <x-vacancy.card :vacancy="$vacancy" class="mb-20"></x-vacancy.card>
                @endforeach
            </div>
        </x-company.page>
    </div>
@endsection
