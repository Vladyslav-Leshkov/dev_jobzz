@extends('backend.layout.app')

@section('title', __('View User'))

@section('content')
    <div class="d-flex justify-content-between">
        <h2> @lang('View User')</h2>
        <div>
            <x-utils.link class="btn btn-sm btn-outline-success" :href="route('admin.user.change-password', $user)" :text="__('Change Password')" />
            <x-utils.link class="btn btn-sm btn-outline-info" :href="route('admin.user.edit', $user)" :text="__('Edit')" />
            <x-utils.link class="btn btn-sm btn-outline-secondary" :href="route('admin.user.index')" :text="__('Back')" />
        </div>
    </div>

    <x-backend.card>

        <x-slot name="body">
            <table class="table table-hover">
                <tr>
                    <th width="300">@lang('Type')</th>
                    <td>@include('backend.auth.user.includes.type')</td>
                </tr>

                <tr>
                    <th>@lang('Avatar')</th>
                    <td><img src="{{ $user->avatarUrl }}" class="user-profile-image" height="100px"  /></td>
                </tr>

                <tr>
                    <th>@lang('First Name')</th>
                    <td>{{ $user->first_name }}</td>
                </tr>

                <tr>
                    <th>@lang('Last Name')</th>
                    <td>{{ $user->last_name }}</td>
                </tr>

                <tr>
                    <th>@lang('Gender')</th>
                    <td>{{ __(!empty($user->gender) ? $user->gender : 'Not specified') }}</td>
                </tr>

                <tr>
                    <th>@lang('Date of Birth')</th>
                    <td>{{ !empty($user->date_of_birth) ? $user->date_of_birth->format('d.m.Y') : '-' }}</td>
                </tr>

                <tr>
                    <th>@lang('E-mail Address')</th>
                    <td>{{ $user->email }}</td>
                </tr>

                <tr>
                    <th>@lang('Phone')</th>
                    <td>{{ $user->phone }}</td>
                </tr>

                <tr>
                    <th>@lang('Company')</th>
                    <td>{{ $user->company ? $user->company->title : '-' }}</td>
                </tr>

                <tr>
                    <th>@lang('Website')</th>
                    <td>{{ $user->website }}</td>
                </tr>

                <tr>
                    <th>@lang('Status')</th>
                    <td>@include('backend.auth.user.includes.status', ['user' => $user])</td>
                </tr>

                <tr>
                    <th>@lang('Verified')</th>
                    <td>@include('backend.auth.user.includes.verified', ['user' => $user])</td>
                </tr>

{{--                <tr>--}}
{{--                    <th>@lang('2FA')</th>--}}
{{--                    <td>@include('backend.auth.user.includes.2fa', ['user' => $user])</td>--}}
{{--                </tr>--}}

                <tr>
                    <th>@lang('Timezone')</th>
                    <td>{{ $user->timezone ?? __('N/A') }}</td>
                </tr>

                <tr>
                    <th>@lang('Last Login At')</th>
                    <td>
                        @if($user->last_login_at)
                            @displayDate($user->last_login_at)
                        @else
                            @lang('N/A')
                        @endif
                    </td>
                </tr>

                <tr>
                    <th>@lang('Last Known IP Address')</th>
                    <td>{{ $user->last_login_ip ?? __('N/A') }}</td>
                </tr>

                @if ($user->isSocial())
                    <tr>
                        <th>@lang('Provider')</th>
                        <td>{{ $user->provider ?? __('N/A') }}</td>
                    </tr>

                    <tr>
                        <th>@lang('Provider ID')</th>
                        <td>{{ $user->provider_id ?? __('N/A') }}</td>
                    </tr>
                @endif

                <tr>
                    <th>@lang('Roles')</th>
                    <td>{!! $user->roles_label !!}</td>
                </tr>

                <tr>
                    <th>@lang('Additional Permissions')</th>
                    <td>{!! $user->permissions_label !!}</td>
                </tr>
            </table>
        </x-slot>

        <x-slot name="footer">
            <small class="float-right text-muted">
                <strong>@lang('Account Created'):</strong> @displayDate($user->created_at) ({{ $user->created_at->diffForHumans() }}),
                <strong>@lang('Last Updated'):</strong> @displayDate($user->updated_at) ({{ $user->updated_at->diffForHumans() }})

                @if($user->trashed())
                    <strong>@lang('Account Deleted'):</strong> @displayDate($user->deleted_at) ({{ $user->deleted_at->diffForHumans() }})
                @endif
            </small>
        </x-slot>
    </x-backend.card>
@endsection
