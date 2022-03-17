@extends('frontend.layout.app')

@section('title', $pageContent->getSeoTitle())
@section('description', $pageContent->getSeoDescription())
@section('keywords', $pageContent->getSeoKeywords())


@section('content')
    <x-page.head class="mb-30 mb-lg-50">{{$pageContent->getSeoH1()}}</x-page.head>
    <div class="container mb-50">
        {!! $pageContent->text !!}
    </div>

@endsection

