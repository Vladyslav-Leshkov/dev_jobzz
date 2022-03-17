
@extends('backend.layout.app')

@section('title', __('User Management'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('User Management')</h1>

        <div>
            <a href="{{route('admin.user.create')}}" class="btn btn-sm btn-outline-info"><i data-feather="user-plus"></i> @lang('Create User')</a>
        </div>
    </div>

    @include('backend.auth.user.includes.tabs')

    <div class="card">
        <div class="card-body">
            <livewire:backend.users-table :status="$status" />


        </div>
    </div>
@endsection
