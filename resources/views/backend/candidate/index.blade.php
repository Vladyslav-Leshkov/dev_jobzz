
@extends('backend.layout.app')

@section('title', __('Candidates'))

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.candidate.index'), 'title'=>__('Candidates')],
        ]) !!}
    </div>
    <div class="d-flex justify-content-between">
        <h1>@lang('Candidates')</h1>

        <div></div>
    </div>

    <div class="card">
        <div class="card-body">
            <livewire:backend.candidates-table />
        </div>
    </div>
@endsection
