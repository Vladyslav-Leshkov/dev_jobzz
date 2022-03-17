@extends('frontend.layout.app')

@section('title', __('Job creation'))


@section('content')
    <vacancy-form
            action="{{route('frontend.profile.vacancy.store')}}"
            page-title="@lang('Job creation')"
            :vacancy='@json($vacancy)'
            :user='@json($user)'
            :company='@json($company)'
            :options='@json($options)'
            :anonymous-count="{{$anonymous_count}}"
    >
        @csrf
    </vacancy-form>
@endsection
