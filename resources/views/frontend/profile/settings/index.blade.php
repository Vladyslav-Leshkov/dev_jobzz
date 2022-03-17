@extends('frontend.layout.app')

@section('title', __('Notifications settings'))


@section('content')
    <x-page.head class="mb-30 mb-lg-50">{{__('Notifications settings')}}</x-page.head>
    <div class="container mb-50">
        <form action="{{route('frontend.profile.settings.update')}}" method="POST">
            @csrf
            @method('PATCH')
            <div class="page-title mb-40">{{__('Where would you like to receive notifications?')}}</div>

            <x-form.checkbox class="mb-16" name="email_notify"
                             :label="__('Email notifications')"
                             :checked="$settings->email_notify"/>

            <div class="d-flex flex-wrap align-items-center">
                <x-form.checkbox class="me-20  mb-16" name="push_notify"
                                 :label="__('PUSH notifications')"
                                 :checked="$settings->push_notify"/>

                @if($settings->push_notify)
                    <button class="btn btn-outline-primary btn-sm d-none  mb-16" id="pus-subscribe-btn">Подписаться на
                        уведомления
                    </button>
                @endif
            </div>


            @if(config('services.telegram-bot-api.enable'))
                <x-form.checkbox class="mb-55" name="telegram_notify"
                                 :label="__('Telegram notifications')"
                                 :checked="$settings->telegram_notify"/>
            @endif
            <div class="page-title mb-40">{{__('Alert settings')}}</div>
            @if(is_recruiter())
                <x-form.checkbox class="mb-16" name="notify_contacts"
                                 :label="__('Candidate opened contacts')"
                                 :checked="$settings->notify_contacts"/>
                <x-form.checkbox class="mb-16" name="notify_message"
                                 :label="__('New messages')"
                                 :checked="$settings->notify_message"/>
                <x-form.checkbox class="mb-16" name="notify_application"
                                 :label="__('New job application')"
                                 :checked="$settings->notify_application"/>
                <x-form.checkbox class="mb-16" name="notify_candidates"
                                 :label="__('New candidates')"
                                 :checked="$settings->notify_candidates"/>
                <x-form.checkbox class="mb-35" name="notify_news"
                                 :label="__('Jobzz.ru news (they will be very rare)')"
                                 :checked="$settings->notify_news"/>
            @endif
            @if(is_candidate())
                <x-form.checkbox class="mb-16" name="notify_message"
                                 :label="__('New messages')"
                                 :checked="$settings->notify_message"/>
                <x-form.checkbox class="mb-16" name="notify_application"
                                 :label="__('New offers')"
                                 :checked="$settings->notify_application"/>
                <x-form.checkbox class="mb-16" name="notify_vacancies"
                                 :label="__('New vacancies in my profile')"
                                 :checked="$settings->notify_vacancies"/>
                <x-form.checkbox class="mb-35" name="notify_news"
                                 :label="__('Jobzz.ru news (they will be very rare)')"
                                 :checked="$settings->notify_news"/>
            @endif
            @if(is_admin())
                <x-form.checkbox class="mb-16" name="notify_message"
                                 :label="__('New messages')"
                                 :checked="$settings->notify_message"/>
            @endif

            <hr>

            <div class="d-flex wizard-btns-row">
                <button type="submit" class="btn btn-primary rounded-pill btn-lg ms-auto">
                    <span>{{__('Save')}}</span> {{svg('arrow-right', 'ms-60')}}</button>
            </div>

        </form>


    </div>

@endsection
