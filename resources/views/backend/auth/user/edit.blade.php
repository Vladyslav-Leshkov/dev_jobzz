@extends('backend.layout.app')

@section('title', __('Update User'))

@section('content')
    <div class="d-flex justify-content-between">
        <h2> @lang('Update User')</h2>
        <div>
            <x-utils.link class="btn btn-sm btn-outline-secondary" :href="route('admin.user.index')" :text="__('Cancel')" />
        </div>
    </div>

    <x-forms.patch :action="route('admin.user.update', $user)" enctype="multipart/form-data">
        <x-backend.card>

            <x-slot name="body">
                <div x-data="{userType : '{{ $user->type }}'}">
                    @if (!$user->isMasterAdmin())
                    <x-utils.form-group name="type"
                                        :label="__('Type')"
                                        :value="old('type') ?? $user->type"
                                        type="select"
                                        required
                                        x-on:change="userType = $event.target.value"
                                        :options="[
                                        ['value'=>User::TYPE_CANDIDATE, 'text'=>__('candidate.title')],
                                        ['value'=>User::TYPE_RECRUITER, 'text'=>__('Recruiter')],
                                        ['value'=>User::TYPE_ADMIN, 'text'=>__('Administrator')],

                                    ]"
                    ></x-utils.form-group>
                    @endif
                        <x-utils.form-upload name="avatar"
                                             :label="__('Avatar')"
                                             accept=".jpg,.png"
                                             class="image-uploader"
                                             :value="$user->avatar"
                                             imgstyle="height: 200px; width: 200px; object-fit: cover;"
                        />
                        <x-utils.form-group name="login"
                                            :label="__('Username')"
                                            :value="old('login') ?? $user->login"
                                            maxlength="100"

                        ></x-utils.form-group>

                        <x-utils.form-group name="email"
                                            type="email"
                                            :label="__('Email')"
                                            :placeholder="__('E-mail Address')"
                                            :value="old('email') ?? $user->email"
                                            maxlength="255"
                                            required
                        ></x-utils.form-group>

                        <x-utils.form-group name="phone" :label="__('Phone')" :value="old('phone') ?? $user->phone" maxlength="100"></x-utils.form-group>

                        <x-utils.form-group name="first_name" :label="__('First Name')" :value="old('first_name') ?? $user->first_name" maxlength="100"></x-utils.form-group>

                    <x-utils.form-group name="last_name" :label="__('Last Name')"
                                        :value="old('last_name') ?? $user->last_name"
                                        maxlength="100"></x-utils.form-group>


                    <x-utils.form-group name="gender"
                                        :label="__('Gender')"
                                        :value="old('gender') ?? $user->gender"
                                        type="select"
                                        :options="[
                                            ['value'=>'', 'text'=>__('Not specified')],
                                            ['value'=>User::GENDER_MALE, 'text'=>__('Male')],
                                            ['value'=>User::GENDER_FEMALE, 'text'=>__('Female')],
                                        ]"
                    ></x-utils.form-group>

                    <x-utils.datepicker-group name="date_of_birth" :label="__('Date of Birth')"
                                              :value="old('date_of_birth') ?? $user->date_of_birth"
                                              maxlength="100"></x-utils.datepicker-group>

                    <x-utils.form-group name="company" :label="__('Company')" :value="old('company') ?? $user->company"
                                        maxlength="100"></x-utils.form-group>
                    <x-utils.form-group name="website" :label="__('Website')" :value="old('website') ?? $user->website"
                                        maxlength="100"></x-utils.form-group>
                </div>
            </x-slot>

            <x-slot name="footer">
                <button class="btn btn-primary float-right" type="submit">@lang('Update User')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.patch>
@endsection
