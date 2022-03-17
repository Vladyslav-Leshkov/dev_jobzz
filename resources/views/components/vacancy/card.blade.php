@props(['vacancy'=> new \App\Models\Job\Vacancy()])
<div {{$attributes->merge(['class'=>'vacancy-item card'])}}>
    <div class="row">
        <div class="col-12 col-lg-auto vacancy-profile-col">
            <div class="profile-avatar">
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
            </div>
        </div>
        <div class="col-12 col-lg vacancy-info-col">

            <div class="row vacancy-info ">
                <div class="col">
                    <div class="publish-date">{{__('Publish Date')}} {{$vacancy->created_at->format('d.m.Y')}}</div>
                    <a href="{{$vacancy->url}}" class="vacancy-title mb-20">{{$vacancy->title}}</a>
                    <div class="vacancy-meta mb-30">
                        <div class="meta-item meta-location">
                            <div class="meta-title">{{__('Location')}}</div>
                            <div class="meta-value">{!! $vacancy->location_title !!}</div>
                        </div>
                        <div class="meta-item meta-experience">
                            <div class="meta-title text-nowrap">{{__('Work experience')}}</div>
                            <div class="meta-value text-nowrap">{{$vacancy->experience_title}}</div>
                        </div>
                        <div class="meta-item meta-english">
                            <div class="meta-title text-nowrap">{{__('English level')}}</div>
                            <div class="meta-value text-nowrap">{{$vacancy->english_title}}</div>
                        </div>
                        @if($vacancy->is_product)
                            <div class="meta-item meta-additional">
                                <div class="meta-title text-nowrap">{{__('Add. Information')}}</div>
                                <div class="meta-value text-nowrap">{{ __('Product company') }}</div>
                            </div>
                        @endif
                    </div>

                </div>
                @if($vacancy->company)
                    <div class="col-auto">
                        <img class="company-logo" src="{{$vacancy->company->logo_url}}"
                             alt="{{$vacancy->company->title}}">
                        <div class="company-title text-center">{{$vacancy->company->title}}</div>
                    </div>
                @endif
            </div>

            <div class="vacancy-description">
                {!! nl2br($vacancy->short_description) !!}
            </div>
        </div>

    </div>

</div>
