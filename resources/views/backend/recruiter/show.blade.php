@extends('backend.layout.app')

@section('title', __('Recruiter').' - '.$user->name)

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.recruiter.index'), 'title'=>__('Recruiters')],
            ['url'=>route('admin.recruiter.show', $user), 'title'=>$user->name],
        ]) !!}
    </div>

    <div class="d-flex justify-content-between">
        <h2> {{__('Recruiter').' - '.$user->name}}</h2>
        <div>
            <x-utils.link class="btn btn-sm btn-outline-secondary" :href="route('admin.recruiter.index')"
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
                    <th>@lang('Telegram')</th>
                    <td>{{ $user->telegram }}</td>
                </tr>
                <tr>
                    <th>@lang('Position')</th>
                    <td>{{ $user->position }}</td>
                </tr>
                @if($user->company)
                    <tr>
                        <th>@lang('Company')</th>
                        <td>{{ $user->company->title }}</td>
                    </tr>
                    <tr>
                        <th>@lang('Logo')</th>
                        <td><img alt="" src="{{ $user->company->logo_url }}" style="height: 80px"/></td>
                    </tr>
                    <tr>
                        <th>@lang('Company Website')</th>
                        <td>
                            @if($user->company->website)
                                <a href="{{$user->company->website}}" target="_blank">{{$user->company->website}}</a>
                            @endif
                        </td>
                    </tr>
                @endif


                <tr>
                    <th>@lang('Status')</th>
                    <td>@include('backend.recruiter.includes.status', ['value' => $user->status])</td>
                </tr>
                <tr>
                    <th>Количество вакансий</th>
                    <td>{{$user->vacancies()->count()}}</td>
                </tr>
                <tr>
                    <th>Совершено наймов</th>
                    <td>{{$user->payouts()->payed()->count()}}</td>
                </tr>
                <tr>
                    <th>Кандидатов на оплату</th>
                    <td>{{$user->payouts()->new()->count()}}</td>
                </tr>
                <tr>
                    <th>@lang('Verified')</th>
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
                            {{$user->last_activity->format('d.m.Y H:i')}}
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
