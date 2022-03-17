@extends('frontend.layout.app')

@section('title', __('Create a profile'))


@section('content')

    <recruiter-wizard
        action='{{route('frontend.profile.wizard.store')}}'
    >
        @csrf
    </recruiter-wizard>

@endsection
