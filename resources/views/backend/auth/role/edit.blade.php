@inject('model', '\App\Models\Auth\User')

@extends('backend.layout.app')

@section('title', __('Update Role'))

@section('content')
    <div class="d-flex justify-content-between">
        <h1>@lang('Update Role')</h1>

        <div>
            <x-utils.link class="card-header-action" :href="route('admin.role.index')" :text="__('Cancel')" />
        </div>
    </div>

    <x-forms.patch :action="route('admin.role.update', $role)">
        <x-backend.card>


            <x-slot name="body">
                <div x-data="{userType : '{{ $role->type }}'}">
                    <div class="form-group row">
                        <label for="name" class="col-md-2 col-form-label">@lang('Type')</label>

                        <div class="col-md-10">
                            <select name="type" class="form-control" required x-on:change="userType = $event.target.value">
                                <option value="{{ $model::TYPE_CANDIDATE }}" {{ $role->type === $model::TYPE_CANDIDATE ? 'selected' : '' }}>@lang('Candidate')</option>
                                <option value="{{ $model::TYPE_RECRUITER }}" {{ $role->type === $model::TYPE_RECRUITER ? 'selected' : '' }}>@lang('Recruiter')</option>
                                <option value="{{ $model::TYPE_ADMIN }}" {{ $role->type === $model::TYPE_ADMIN ? 'selected' : '' }}>@lang('Administrator')</option>
                                <option value="{{ $model::TYPE_SUPPORT }}" {{ $role->type === $model::TYPE_SUPPORT ? 'selected' : '' }}>@lang('Support')</option>
                            </select>
                        </div>
                    </div><!--form-group-->

                    <div class="form-group row">
                        <label for="name" class="col-md-2 col-form-label">@lang('Name')</label>

                        <div class="col-md-10">
                            <input type="text"  name="name" class="form-control" placeholder="{{ __('Name') }}" value="{{ old('name') ?? $role->name }}" maxlength="100" required />
                        </div>
                    </div><!--form-group-->

                    @include('backend.auth.includes.permissions')
                </div>
            </x-slot>

            <x-slot name="footer">
                <button class="btn btn-sm btn-primary float-right" type="submit">@lang('Update Role')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.patch>
@endsection
