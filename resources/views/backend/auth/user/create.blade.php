@extends('backend.layout.app')

@section('title', __('Create User'))

@section('content')
    <div class="d-flex justify-content-between">
        <h2> @lang('Create User')</h2>
        <div>
            <x-utils.link class="btn btn-sm btn-outline-secondary" :href="route('admin.user.index')"
                          :text="__('Cancel')"/>
        </div>
    </div>

    <x-forms.post :action="route('admin.user.store')" enctype="multipart/form-data">
        <x-backend.card>

            <x-slot name="body">
                <div x-data="{userType : '{{ User::TYPE_CANDIDATE }}', userStatus: {{User::STATUS_ACTIVE}}}">

                    <x-utils.form-group name="type"
                                        :label="__('Type')"
                                        :value="old('type')"
                                        type="select"
                                        required
                                        x-on:change="userType = $event.target.value"
                                        :options="[
                                            ['value'=>User::TYPE_CANDIDATE, 'text'=>__('candidate.title')],
                                            ['value'=>User::TYPE_RECRUITER, 'text'=>__('Recruiter')],
                                            ['value'=>User::TYPE_ADMIN, 'text'=>__('Administrator')],
                                            ['value'=>User::TYPE_SUPPORT, 'text'=>__('Support')],
                                        ]"
                    ></x-utils.form-group>

                    <x-utils.form-upload name="avatar"
                                         :label="__('Avatar')"
                                         accept=".jpg,.png"
                                         class="image-uploader"
                                         value=""
                                         imgstyle="height: 200px; width: 200px; object-fit: cover;"
                    />

                    <x-utils.form-group name="login" :label="__('Username')" :value="old('login', '')"
                                        maxlength="100"></x-utils.form-group>

                    <x-utils.form-group name="email"
                                        type="email"
                                        :label="__('Email')"
                                        :placeholder="__('E-mail Address')"
                                        :value="old('email')"
                                        maxlength="255"
                                        required
                    ></x-utils.form-group>

                    <x-utils.form-group name="phone" :label="__('Phone')" :value="old('phone', '')"
                                        maxlength="100"></x-utils.form-group>

                    <x-utils.form-group name="first_name" :label="__('First Name')" :value="old('first_name', '')"
                                        maxlength="100"></x-utils.form-group>

                    <x-utils.form-group name="last_name" :label="__('Last Name')" :value="old('last_name', '')"
                                        maxlength="100"></x-utils.form-group>

                    <x-utils.form-group name="gender"
                                        :label="__('Gender')"
                                        :value="old('gender')"
                                        type="select"
                                        :options="[
                                            ['value'=>'', 'text'=>__('Not specified')],
                                            ['value'=>User::GENDER_MALE, 'text'=>__('Male')],
                                            ['value'=>User::GENDER_FEMALE, 'text'=>__('Female')],
                                        ]"
                    ></x-utils.form-group>

                    <x-utils.datepicker-group name="date_of_birth" :label="__('Date of Birth')"
                                              :value="old('date_of_birth')" maxlength="100"></x-utils.datepicker-group>

                    <x-utils.form-group name="company" :label="__('Company')" :value="old('company')"
                                        maxlength="100"></x-utils.form-group>

                    <x-utils.form-group name="website" :label="__('Website')" :value="old('website')"
                                        maxlength="100"></x-utils.form-group>

                    <x-utils.form-group type="password" name="password" :label="__('Password')" maxlength="100" required
                                        autocomplete="new-password"></x-utils.form-group>

                    <x-utils.form-group type="password" name="password_confirmation"
                                        :label="__('Password Confirmation')" maxlength="100" required
                                        autocomplete="new-password"></x-utils.form-group>

                    <x-utils.form-group name="status"
                                        :label="__('Status')"
                                        :value="old('status')"
                                        type="select"
                                        required
                                        :options="[
                                            ['value'=>User::STATUS_ACTIVE, 'text'=>__('Active')],
                                            ['value'=>User::STATUS_INACTIVE, 'text'=>__('Inactive')],
                                        ]"
                    ></x-utils.form-group>

                    <div x-data="{ emailVerified : false }">

                        <x-utils.form-group name="email_verified"
                                            :label="__('E-mail Verified')"
                                            :value="1"
                                            type="checkbox"
                                            x-on:click="emailVerified = !emailVerified"
                        ></x-utils.form-group>



                        <div x-show="!emailVerified">
                            <x-utils.form-group name="send_confirmation_email"
                                                :label="__('Send Confirmation E-mail')"
                                                :value="1"
                                                type="checkbox"
                            ></x-utils.form-group>

                        </div>
                    </div>

                </div>
            </x-slot>

            <x-slot name="footer">
                <button class="btn btn-primary" type="submit">@lang('Create User')</button>
            </x-slot>
        </x-backend.card>
    </x-forms.post>

@endsection

