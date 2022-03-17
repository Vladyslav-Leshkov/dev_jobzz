
@extends('backend.layout.app')

@section('title', __('Specialization'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Specialization')</h1>

        <div>
            <a href="{{route('admin.specialization.create')}}" class="btn btn-sm btn-outline-info"><i data-feather="plus"></i> @lang('Create')</a>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <livewire:backend.specialization-table />
        </div>
    </div>
@endsection
