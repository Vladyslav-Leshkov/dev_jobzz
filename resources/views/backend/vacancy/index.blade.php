
@extends('backend.layout.app')

@section('title', __('Vacancies'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Vacancies')</h1>

        <div>
            <a href="{{route('admin.user.create')}}" class="btn btn-sm btn-outline-info"><i data-feather="plus"></i> @lang('Create')</a>
        </div>
    </div>

    @include('backend.vacancy.includes.tabs')
    <div class="card">
        <div class="card-body">
            <livewire:backend.vacancies-table :status="$status" />


        </div>
    </div>
@endsection
