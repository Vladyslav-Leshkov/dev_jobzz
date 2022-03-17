@extends('frontend.layout.app')

@section('title', __('Create a profile'))


@section('content')
    <candidate-wizard
        action='{{route('frontend.profile.wizard.store')}}'
        :options='@json($options)'
    >
        @csrf
    </candidate-wizard>
@endsection
