@extends('backend.layout.app')

@section('title', __('Notifications'))

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.notifications.index'), 'title'=>__('Notifications')],
        ]) !!}
    </div>
    <div class="d-flex justify-content-between">
        <h1>@lang('Notifications')</h1>

        <div></div>
    </div>

    <livewire:backend.notifications/>
@endsection
