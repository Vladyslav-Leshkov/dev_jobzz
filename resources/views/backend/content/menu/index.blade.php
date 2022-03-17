@extends('backend.layout.app')

@section('title', __('Menu management'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Menu management')</h1>

        <div class="d-flex align-items-center">
            <x-utils.translation-dropdown  />
            @if($logged_in_user->isMasterAdmin())
                <a href="{{route('admin.menus.create')}}" class="btn btn-sm btn-outline-info"><i data-feather="user-plus"></i> @lang('Create menu')</a>
            @endif
        </div>
    </div>

    <livewire:backend.menu-list :locale="request()->input('trans_locale', 'ru')"/>

@endsection
