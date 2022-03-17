@extends('frontend.layout.app')

@section('title', $pageContent->getSeoTitle())
@section('description', $pageContent->getSeoDescription())
@section('keywords', $pageContent->getSeoKeywords())


@section('content')

    @include('frontend.home.includes.banner')

    @include('frontend.home.includes.description')

{{-- @include('frontend.home.includes.vacancies') --}}

{{--    @include('frontend.home.includes.partners')--}}

    @include('frontend.home.includes.process')

    {{--    @include('frontend.home.includes.offer')--}}


@endsection
