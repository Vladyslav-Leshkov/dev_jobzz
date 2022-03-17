@extends('backend.layout.app')

@section('title', __('Edit specialization'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Edit specialization')</h1>

        <div class="d-flex align-items-center">
            <a href="{{route('admin.specialization.index')}}" class="btn btn-sm btn-outline-secondary">@lang('Cancel')</a>
        </div>
    </div>

    <x-forms.patch :action="route('admin.specialization.update', $specialization)" enctype="multipart/form-data">
        <x-backend.card>
            <x-slot name="body">

                @include('backend.specialization.includes.form')

            </x-slot>
            <x-slot name="footer">
                <button class="btn btn-primary" type="submit">@lang('Save')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.patch>


@endsection
