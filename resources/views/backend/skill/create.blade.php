@extends('backend.layout.app')

@section('title', __('Create skill'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('New skill')</h1>

        <div class="d-flex align-items-center">
            <a href="{{route('admin.skill.index')}}" class="btn btn-sm btn-outline-secondary">@lang('Cancel')</a>
        </div>
    </div>

    <x-forms.post :action="route('admin.skill.store')" enctype="multipart/form-data">
        <x-backend.card>
            <x-slot name="body">
                @include('backend.skill.includes.form')

            </x-slot>
            <x-slot name="footer">
                <button class="btn btn-primary" type="submit">@lang('Save')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.post>


@endsection
