@extends('frontend.layout.app')

@section('title', __('Create a profile'))


@section('content')
    <x-page.head class="mb-30 mb-lg-50">{{$pageContent->seo_h1 ?? $pageContent->title}}</x-page.head>
    <div class="container mb-50 agree-page">
        {!! $pageContent->text !!}

        <form class="py-50 d-flex justify-content-center" method="post"
              action="{{route('frontend.profile.wizard.agree')}}">
            @csrf
            @method('PUT')
            <div class="agree-page-btns">
                <button class="btn btn-lg btn-primary btn-block mb-20 px-10" type="submit" name="agree"
                        value="1">@lang('I have read and accept the terms of use')</button>
                <button class="btn btn-lg btn-outline-secondary btn-block px-10" type="submit" name="agree"
                        value="0">@lang('I disagree with the terms of use. Delete account.')</button>
            </div>

        </form>
    </div>

@endsection
