@extends('backend.layout.app')

@section('title', __('Page management'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Page management')</h1>

        <div class="d-flex align-items-center">
            @if($logged_in_user->isMasterAdmin())
                <a href="{{route('admin.page.create')}}" class="btn btn-sm btn-outline-info"><i
                            data-feather="user-plus"></i> @lang('Create page')</a>
            @endif
        </div>
    </div>

    <x-backend.card>
        <x-slot name="body">

            <table class="table table-responsive table-striped table-sm">
                <thead>
                <tr>

                    <th>@lang('Title')</th>
                    <th>@lang('Url')</th>
                    <th>@lang('Actions')</th>
                </tr>
                </thead>
                <tbody>
                @foreach($pages as $page)
                    <tr>
                        <td>{{$page->title}}</td>
                        <td>{{$page->slug}}</td>

                        <td class="table-action">

                            <x-utils.view-button class="me-2 mb-2" :href="route('frontend.pages', $page)" text=""
                                                 target="_blank"/>
                            <x-utils.edit-button class="me-2 mb-2" :href="route('admin.page.edit', $page)" text=""/>
                            @if($logged_in_user->isMasterAdmin())
                                <x-utils.delete-button :href="route('admin.page.destroy', $page)" text=""/>
                            @endif
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </x-slot>
    </x-backend.card>

@endsection
