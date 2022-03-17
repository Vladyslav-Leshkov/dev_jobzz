@props(['user'=> new App\Models\Auth\User(), 'company'=> new \App\Models\Job\Company(), 'vacancies'=>[]])
<div {{ $attributes->merge(['class' => 'recruiter-item recruiter-page']) }}>
    <div class="row">
        <div class="col-auto">
            <div class="recruiter-avatar">
                @if($user->has_avatar || empty($user->initials))
                    <img src="{{$user->avatar_url}}" alt="{{$user->name}}">
                @else
                    <span class="avatar-initials">
                        {{ $user->initials }}
                    </span>
                @endif
            </div>
        </div>
        <div class="col">
            <div class="row justify-content-between mb-30">
                <div class="col">
                    <div class="profile-title">{{$user->name}}</div>
                    <div class="recruiter-position"><span>{{$user->position}}</span> @lang('in') {{$company->title}}
                    </div>
                    <div class="recruiter-activity">Последняя активность на сайте: {{$user->last_activity_title}}</div>

                </div>
                <div class="col-auto">
                    <a href="{{$company->url}}"><img class="company-logo" src="{{$company->logo_url}}"
                                                     alt="{{$company->title}}"></a>
                </div>
            </div>
            <div class="row justify-content-between align-items-center mb-30 font-15 fw-bold">
                <div class="col-12 col-md">
                    Совершено наймов на jobzz.ru: <span class="text-primary">{{$user->hires}}</span>
                </div>
                <div class="col-12 col-md-auto">
                    Все открытые вакансии компании <a href="{{$company->url}}"
                                                      class="ms-15 btn btn-primary btn-circle">{{svg('arrow-right')}}</a>
                </div>
            </div>

            <hr class="mb-30">
            <div class="row">
                <div class="col-12 mb-30">
                    <div class="profile-title mb-30">Открытые вакансии</div>

                    <div class="recruiter-vacancies">
                        @foreach($vacancies as $vacancy)
                            <a href="{{$vacancy->url}}">{{$vacancy->title}}</a>
                        @endforeach
                    </div>
                </div>
                <div class="col-12">
                    <div class="profile-title">О компании {{$company->title}}</div>
                    <div class="company-description mb-50 font-15">
                        {!! nl2br(strip_tags($company->description)) !!}
                    </div>

                    <div class="company-meta mb-20">
                        @if($company->address)
                            <div class="meta-item">
                                <div class="meta-icon">{{svg('building')}}</div>
                                <div>
                                    <div class="meta-title">@lang('Headquarters'):</div>
                                    <div class="meta-value">{{$company->address}}</div>
                                </div>
                            </div>
                        @endif
                        @if($company->website)
                            <div class="meta-item">
                                <div class="meta-icon">{{svg('url')}}</div>
                                <div>
                                    <div class="meta-title">@lang('Website'):</div>
                                    <div class="meta-value">
                                        <a href="{{$company->website}}" target="_blank"
                                           rel="nofollow">{{$company->website}}</a>
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>

                </div>
            </div>

            {{$slot ?? ''}}
        </div>
    </div>
</div>
