@extends('frontend.layout.app')

@section('title', __('My Profile'))


@section('content')
    @if($user->isCandidate())
        <candidate-account
            action='{{route('frontend.profile.update')}}'
            :user='@json($user)'
            :profile='@json($model)'
            :options='@json($options)'
        >
            @csrf
            @method('PUT')
        </candidate-account>
    @endif
    @if($user->isRecruiter())

        <recruiter-account
            action='{{route('frontend.profile.update')}}'
            :user='@json($user)'
            :company='@json($model)'
        >
            @csrf
            @method('PUT')
        </recruiter-account>
    @endif

@endsection
