@extends('backend.layout.app')

@section('title', __('candidate.title').' - '.$user->name)

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.candidate.index'), 'title'=>__('Candidates')],
            ['url'=>route('admin.candidate.show', $user), 'title'=>$user->name],
        ]) !!}
    </div>

    <div class="d-flex justify-content-between">
        <h2> {{__('candidate.title').' - '.$user->name}}</h2>
        <div>
            <x-utils.link class="btn btn-sm btn-outline-secondary" :href="route('admin.candidate.index')"
                          :text="__('Back')"/>
        </div>
    </div>

    <x-backend.card>

        <x-slot name="body">
            <table class="table table-hover">

                <tr>
                    <th style="width: 300px;">@lang('Avatar')</th>
                    <td><img alt="" src="{{ $user->avatarUrl }}" class="user-profile-image"
                             style="width: 100px; height: 100px; object-fit: cover"/></td>
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
                    <th>@lang('Position')</th>
                    <td>{{ $user->position }}</td>
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
                    <th>@lang('LinkedIn')</th>
                    <td>
                        @if($user->linked_in)
                            <a href="{{$user->linked_in}}" target="_blank">{{$user->linked_in}}</a>
                        @endif
                    </td>
                </tr>
                <tr>
                    <th>@lang('Resume')</th>
                    <td>
                        @if(!empty($user->resume_url))
                            <a href="{{$user->resume_url}}" target="_blank">Скачать резюме</a>
                        @endif
                    </td>
                </tr>
                @if($user->candidate_profile)
                    <tr>
                        <th>@lang('Description')</th>
                        <td>{{ $user->candidate_profile->description }}</td>
                    </tr>
                    <tr>
                        <th>@lang('candidate.english-level')</th>
                        <td>
                            {{$user->candidate_profile->english_title}}
                        </td>
                    </tr>
                    <tr>
                        <th>@lang('candidate.experience')</th>
                        <td>
                            {{$user->candidate_profile->experience_title}}
                        </td>
                    </tr>
                    <tr>
                        <th>@lang('candidate.price_full_time')</th>
                        <td>
                            {{$user->candidate_profile->price_title}}
                        </td>
                    </tr>
                    <tr>
                        <th>@lang('candidate.price_freelance')</th>
                        <td>
                            {{$user->candidate_profile->price_freelance_title}}
                        </td>
                    </tr>
                @endif


                <tr>
                    <th>@lang('Status')</th>
                    <td>@include('backend.candidate.includes.status', ['value' => $user->status])</td>
                </tr>
                <tr>
                    <th>@lang('Email Verified')</th>
                    <td>@include('backend.auth.user.includes.verified', ['user' => $user])</td>
                </tr>

                <tr>
                    <th>@lang('Timezone')</th>
                    <td>{{ $user->timezone ?? __('N/A') }}</td>
                </tr>

                <tr>
                    <th>@lang('Last Activity')</th>
                    <td>
                        @if($user->last_login_at)
                            {{$user->last_activity ? $user->last_activity->format('d.m.Y H:i') :  __('N/A')}}
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


            </table>
        </x-slot>

        <x-slot name="footer">
            <small class="float-right text-muted">
                <strong>@lang('Account Created'):</strong> {{$user->created_at->toDayDateTimeString()}}
                ({{ $user->created_at->diffForHumans() }}),
                <strong>@lang('Last Updated'):</strong> {{$user->updated_at->toDayDateTimeString()}}
                ({{ $user->updated_at->diffForHumans() }})

                @if($user->trashed())
                    <strong>@lang('Account Deleted'):</strong>  {{$user->deleted_at->toDayDateTimeString()}}
                    ({{ $user->deleted_at->diffForHumans() }})
                @endif
            </small>
        </x-slot>
    </x-backend.card>
@endsection
