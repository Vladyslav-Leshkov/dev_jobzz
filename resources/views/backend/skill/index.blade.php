
@extends('backend.layout.app')

@section('title', __('Skills'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Skills')</h1>

        <div>
            <a href="{{route('admin.skill.create')}}" class="btn btn-sm btn-outline-info"><i data-feather="plus"></i> @lang('Create')</a>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <livewire:backend.skills-table />
        </div>
    </div>
@endsection
