@props([
    'offer'=>new \App\Models\Job\Offer(),
])
<div {{$attributes->merge(['class'=>'vacancy-item card'])}}>
    <div class="row">
        <div class="col-12 col-lg-auto vacancy-profile-col">
            <div class="profile-avatar">
                @if($offer->vacancy->has_avatar || empty($offer->vacancy->initials))
                    <img src="{{$offer->vacancy->avatar_url}}" alt="{{$offer->vacancy->name}}">
                @else
                    <span class="avatar-initials">
                        {{ $offer->vacancy->initials }}
                    </span>
                @endif
                <div class="profile-name">
                    {{$offer->vacancy->first_name}}<br>
                    {{$offer->vacancy->last_name}}
                </div>
            </div>
        </div>
        <div class="col-12 col-lg vacancy-info-col">

            <div class="row vacancy-info ">
                <div class="col">
                    <div class="publish-date">{{$offer->recruiter->company->title}}</div>
                    <a href="{{$offer->vacancy->url}}" class="vacancy-title mb-20">{{$offer->vacancy->title}}</a>
                    <div class="vacancy-meta mb-30">
                        <div class="meta-item">
                            <div class="meta-title">{{__('Location')}}</div>
                            <div class="meta-value">{!! $offer->vacancy->location_title !!}</div>
                        </div>
                        <div class="meta-item">
                            <div class="meta-title text-nowrap">{{__('Work experience')}}</div>
                            <div class="meta-value text-nowrap">{{$offer->vacancy->experience_title}}</div>
                        </div>
                        <div class="meta-item">
                            <div class="meta-title text-nowrap">{{__('English level')}}</div>
                            <div class="meta-value text-nowrap">{{$offer->vacancy->english_title}}</div>
                        </div>
                    </div>

                </div>
                @if($offer->vacancy->company)
                    <div class="col-auto">
                        <img class="company-logo" src="{{$offer->vacancy->company->logo_url}}"
                             alt="{{$offer->vacancy->company->title}}">

                    </div>
                @endif
            </div>

            <div class="vacancy-description">
                <div v-is="'recruiter-confirm'"
                     :offer='@json($offer)'
                     :current-user='@json(current_user()->shortInfo())'
                >
                </div>
            </div>
        </div>

    </div>

</div>

