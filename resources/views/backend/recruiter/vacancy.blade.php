@extends('backend.layout.app')

@section('title', __('Vacancies').' - '.$vacancy->title)

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.recruiter.index'), 'title'=>__('Recruiters')],
            ['url'=>route('admin.recruiter.show', $user), 'title'=>$user->name],
            ['url'=>route('admin.recruiter.vacancy.index', $user), 'title'=>__('Vacancies')],
            ['url'=>route('admin.recruiter.vacancy.show', [$user, $vacancy]), 'title'=>str_limit($vacancy->title)],
        ]) !!}
    </div>
    <div class="d-flex justify-content-between">
        <h1>{{$user->name }} - @lang('Vacancy') {{$vacancy->title}}</h1>

        <div>
            <a href="{{route('admin.recruiter.vacancy.index', $user)}}">Назад к списку</a>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <x-vacancy.page :vacancy="$vacancy" class="mw-1020"></x-vacancy.page>
        </div>
    </div>
@endsection
