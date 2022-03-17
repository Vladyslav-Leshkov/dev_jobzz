@extends('backend.layout.app')

@section('title', __('Html Blocks'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Html Blocks')</h1>

        <div class="d-flex align-items-center">

        </div>
    </div>

    <x-backend.card>
        <x-slot name="body">

            <table class="table table-responsive table-striped table-sm">
                <thead>
                <tr>

                    <th>@lang('Title')</th>
                    <th>@lang('Title') {{strtoupper(app()->getLocale())}}</th>
                    <th>@lang('Text') {{strtoupper(app()->getLocale())}}</th>
                    <th>@lang('Actions')</th>
                </tr>
                </thead>
                <tbody>
                @foreach($items as $item)
                    <tr>
                        <td>{{$item->admin_title}}</td>
                        <td><strong>{!! $item->title !!}</strong></td>
                        <td>
                            <div>{!! $item->description !!}</div>
                        </td>
                        <td class="table-action">
                            <x-utils.edit-button :href="route('admin.html-block.edit', $item)" text=""/>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </x-slot>
    </x-backend.card>

@endsection
