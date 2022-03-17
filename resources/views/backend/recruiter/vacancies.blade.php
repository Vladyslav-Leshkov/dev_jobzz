
@extends('backend.layout.app')

@section('title', __('Vacancies'))

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.recruiter.index'), 'title'=>__('Recruiters')],
            ['url'=>route('admin.recruiter.show', $user), 'title'=>$user->name],
            ['url'=>route('admin.recruiter.vacancy.index', $user), 'title'=>__('Vacancies')],
        ]) !!}
    </div>
    <div class="d-flex justify-content-between">
        <h1>{{$user->name }} - @lang('Vacancies')</h1>

        <div>
            <a href="{{route('admin.recruiter.index')}}">Назад к списку</a>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <livewire:backend.users-vacancies-table :user="$user" />
        </div>
    </div>
@endsection
