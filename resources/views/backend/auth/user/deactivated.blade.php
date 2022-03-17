@extends('backend.layout.app')

@section('title', __('Deactivated Users'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Deactivated Users')</h1>

        <div>

        </div>
    </div>

    @include('backend.auth.user.includes.tabs')

    <x-backend.card>
        <x-slot name="body">
            <livewire:backend.users-table status="deactivated" />
        </x-slot>
    </x-backend.card>
@endsection
