@extends('frontend.layout.app')

@section('title', $user->name.' - '.__('profile'))


@section('content')
    {{--    <x-page.head class="mb-30 mb-lg-50"><span>{{$user->name}} - {{__('profile')}} </span></x-page.head>--}}

    <div class="container  my-50 my-lg-100">
        <x-recruiter.page :user="$user"
                          :company="$company"
                          :vacancies="$vacancies"
        ></x-recruiter.page>
    </div>
@endsection
