@extends('backend.layout.app')

@section('title', __('Role Management'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Role Management')</h1>

        <div>
            <a href="{{route('admin.role.create')}}" class="btn btn-sm btn-outline-info"><i data-feather="plus"></i> @lang('Create Role')</a>
        </div>
    </div>

    <x-backend.card>
        <x-slot name="body">
            <livewire:backend.roles-table />
        </x-slot>
    </x-backend.card>
@endsection
