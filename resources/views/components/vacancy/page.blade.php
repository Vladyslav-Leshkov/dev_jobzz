@props(['vacancy'=> new \App\Models\Job\Vacancy()])
<div {{ $attributes->merge(['class' => 'profile-item vacancy-page']) }}>

    <div class="profile-row ">
        <div class="profile-col-avatar">
            <a href="{{$vacancy->recruiter_url}}" class="profile-avatar">
                @if($vacancy->has_avatar || empty($vacancy->initials))
                    <img src="{{$vacancy->avatar_url}}" alt="{{$vacancy->name}}">
                @else
                    <span class="avatar-initials">
                        {{ $vacancy->initials }}
                    </span>
                @endif
                <div class="profile-name">
                    {{$vacancy->first_name}}<br>
                    {{$vacancy->last_name}}
                </div>
                <span class="profile-position">{{$vacancy->position}}</span>
                <span class="profile-position"> в {{$vacancy->company->title}}</span>
            </a>
        </div>
        <div class="profile-col-text">
            <div class="row flex-lg-column-reverse flex-md-row mb-10">
                <div class="col-12 col-lg mb-20 mb-md-5">
                    <div class="publish-date">
                        @lang('Publish Date') {{$vacancy->created_at->format('d.m.Y')}}
                        @if($vacancy->status === \App\Models\Job\Vacancy::STATUS_ARCHIVED)
                            <b class="text-dark fw-bold ms-10">(@lang('Vacancy Archived'))</b>
                        @endif
                        @if($vacancy->status === \App\Models\Job\Vacancy::STATUS_INACTIVE)
                            <b class="text-dark fw-bold ms-10">(@lang('Vacancies in the hold'))</b>
                        @endif
                    </div>
                    <h1 class="profile-title">{{$vacancy->title}}</h1>

                </div>
                @if($vacancy->company)
                    <div class="col-12 col-lg-auto mb-20 mb-md-5 text-center">
                        <img class="company-logo" src="{{$vacancy->company->logo_url}}"
                             alt="{{$vacancy->company->title}}">
                    </div>
                @endif
            </div>
            <div class="vacancy-meta mb-30">
                <div class="meta-item">
                    <div class="meta-title">@lang('Location')</div>
                    <div class="meta-value">{!! $vacancy->location_title !!}</div>
                </div>
                <div class="meta-item">
                    <div class="meta-title">@lang('Experience')</div>
                    <div class="meta-value">{{$vacancy->experience_title}}</div>
                </div>
                <div class="meta-item">
                    <div class="meta-title">@lang('English level')</div>
                    <div class="meta-value">{{$vacancy->english_title}}</div>
                </div>
            </div>
            <div class="vacancy-description mb-30">
                @if(!empty($vacancy->short_description))
                    <p class="fw-bold">{!! nl2br($vacancy->short_description) !!}</p>
                @endif

                {!! $vacancy->description !!}
            </div>

            @if($vacancy->company)
                <hr class="mb-40">
                <div class="profile-title mb-15">@lang('About company') {{$vacancy->company->title}}</div>
                <div class="company-description mb-30 font-15">
                    {!! nl2br(strip_tags($vacancy->company->description)) !!}
                </div>
                <div class="company-meta mb-20">
                    @if($vacancy->company->address)
                        <div class="meta-item">
                            <div class="meta-icon">{{svg('building')}}</div>
                            <div>
                                <div class="meta-title">@lang('Headquarters'):</div>
                                <div class="meta-value">{{$vacancy->company->address}}</div>
                            </div>
                        </div>
                    @endif
                    @if($vacancy->company->website)
                        <div class="meta-item">
                            <div class="meta-icon">{{svg('url')}}</div>
                            <div>
                                <div class="meta-title">@lang('Website'):</div>
                                <div class="meta-value">
                                    <a href="{{$vacancy->company->website}}" target="_blank"
                                       rel="nofollow">{{$vacancy->company->website}}</a>
                                </div>
                            </div>
                        </div>
                    @endif
                </div>

            @endif
            <hr>
            {{$slot ?? ''}}
        </div>
    </div>

</div>
