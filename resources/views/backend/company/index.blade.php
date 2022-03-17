
@extends('backend.layout.app')

@section('title', __('Companies'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Companies')</h1>

        <div></div>
    </div>

    <div class="card">
        <div class="card-body">
            <livewire:backend.companies-table />
        </div>
    </div>
@endsection
