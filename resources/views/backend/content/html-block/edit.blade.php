@extends('backend.layout.app')

@section('title', __('Edit').' '.__('Html Block'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Edit') @lang('Html Block') - {{$item->admin_title}}</h1>

        <div class="d-flex align-items-center">
            <a href="{{route('admin.html-block.index')}}" class="btn btn-sm btn-outline-secondary">@lang('Cancel')</a>
        </div>
    </div>

    <x-forms.patch :action="route('admin.html-block.update', $item)" enctype="multipart/form-data">
        <x-backend.card>
            <x-slot name="body">
                @include('backend.content.html-block.includes.form')

            </x-slot>
            <x-slot name="footer">
                <button class="btn btn-primary" type="submit">@lang('Save')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.patch>


@endsection
