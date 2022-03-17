@inject('model', '\App\Models\Auth\User')

@extends('backend.layout.app')

@section('title', __('Create Role'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Create Role')</h1>

        <div>
            <x-utils.link class="card-header-action" :href="route('admin.role.index')" :text="__('Cancel')" />
        </div>
    </div>

    <x-forms.post :action="route('admin.role.store')">
        <x-backend.card>

            <x-slot name="body">
                <div x-data="{userType : '{{ $model::TYPE_CANDIDATE }}'}">
                    <div class="form-group row">
                        <label for="name" class="col-md-2 col-form-label">@lang('Type')</label>

                        <div class="col-md-10">
                            <select name="type" class="form-control" required x-on:change="userType = $event.target.value">
                                <option value="{{ $model::TYPE_CANDIDATE }}">@lang('Candidate')</option>
                                <option value="{{ $model::TYPE_RECRUITER }}">@lang('Recruiter')</option>
                                <option value="{{ $model::TYPE_ADMIN }}">@lang('Administrator')</option>
                                <option value="{{ $model::TYPE_SUPPORT }}">@lang('Support')</option>
                            </select>
                        </div>
                    </div><!--form-group-->

                    <div class="form-group row">
                        <label for="name" class="col-md-2 col-form-label">@lang('Name')</label>

                        <div class="col-md-10">
                            <input type="text" name="name" class="form-control" placeholder="{{ __('Name') }}" value="{{ old('name') }}" maxlength="100" required />
                        </div>
                    </div>

                    @include('backend.auth.includes.permissions')
                </div>
            </x-slot>

            <x-slot name="footer">
                <button class="btn btn-sm btn-primary float-right" type="submit">@lang('Create Role')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.post>
@endsection
