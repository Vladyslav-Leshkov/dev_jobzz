@extends('backend.layout.app')

@section('title', __('Deleted Users'))


@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Deleted Users')</h1>

        <div>

        </div>
    </div>

    @include('backend.auth.user.includes.tabs')

    <x-backend.card>
        <x-slot name="body">
            <livewire:backend.users-table status="deleted" />
        </x-slot>
    </x-backend.card>
@endsection
