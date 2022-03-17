@extends('frontend.layout.app')

@section('title', __('My contacts and resume'))


@section('content')
    <x-page.head class="mb-30 mb-lg-50">
        <span>{{__('My contacts and resume')}}</span>
    </x-page.head>
    <div class="container-fluid container-lg  mb-50 mb-lg-100">
        <form v-is="'candidate-contacts'"
              action='{{route('frontend.profile.contact.update')}}'
              :user='@json($user)'
              :profile='@json($profile)'
        >
            @csrf
            @method('PATCH')
        </form>

    </div>

@endsection
