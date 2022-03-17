@extends('frontend.layout.app')

@section('title', __('Edit Vacancy'))


@section('content')
    <vacancy-form
        action="{{route('frontend.profile.vacancy.update', $vacancy)}}"
        page-title="@lang('Edit Vacancy')"
        :vacancy='@json($vacancy)'
        :user='@json($user)'
        :company='@json($company)'
        :options='@json($options)'
        :anonymous-count="{{$anonymous_count}}"
    >
        @csrf
        @method('PATCH')
    </vacancy-form>
@endsection
