@extends('backend.layout.app')

@section('title', __('New page'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('New page')</h1>

        <div class="d-flex align-items-center">
            <a href="{{route('admin.page.index')}}" class="btn btn-sm btn-outline-secondary">@lang('Cancel')</a>
        </div>
    </div>

    <x-forms.post :action="route('admin.page.store')" enctype="multipart/form-data">
        <x-backend.card>
            <x-slot name="body">
                @include('backend.content.page.includes.form')

            </x-slot>
            <x-slot name="footer">
                <button class="btn btn-primary" type="submit">@lang('Create page')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.post>


@endsection
