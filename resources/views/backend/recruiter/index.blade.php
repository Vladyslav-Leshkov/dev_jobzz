
@extends('backend.layout.app')

@section('title', __('Recruiters'))

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.recruiter.index'), 'title'=>__('Recruiters')],
        ]) !!}
    </div>
    <div class="d-flex justify-content-between">
        <h1>@lang('Recruiters')</h1>

        <div></div>
    </div>

    <div class="card">
        <div class="card-body">
            <livewire:backend.recruiters-table />
        </div>
    </div>
@endsection
