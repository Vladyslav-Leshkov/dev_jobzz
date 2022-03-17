@props([
    'offer'=>new \App\Models\Job\Offer(),
])

<div class="card recruiter-item p-25 mb-30">
    <div class="row">
        <div class="col-12 col-lg-auto">
            <div class="recruiter-avatar me-lg-0">
                <img src="{{$offer->recruiter->avatar_url}}" alt="{{$offer->recruiter->name}}">
            </div>
        </div>
        <div class="col-12 col-lg">
            <div class="row recruiter-item-row mb-10">
                <div class="col">
                    <div class="publish-date">{{$offer->recruiter->company->title}}</div>
                    <div class="profile-title">{{$offer->recruiter->name}}</div>
                    <div class="recruiter-position"><span>{{$offer->recruiter->position}}</span></div>
                </div>
                <div class="col-auto">
                    <a href="{{$offer->recruiter->company->url}}">
                        <img class="company-logo" src="{{$offer->recruiter->company->logo_url}}"
                             alt="{{$offer->recruiter->company->title}}">
                    </a>
                </div>
            </div>
            <hr class="mb-20">
            @if($offer->vacancy ?? false)
                <div class="vacancy-meta mb-30">
                    <div class="meta-item">
                        <div class="meta-title">{{__('Vacancy')}}</div>
                        <div class="meta-value">{{ $offer->vacancy->title }}</div>
                    </div>
                    <div class="meta-item mw-250">
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
            @endif
            <div v-is="'recruiter-confirm'"
                 :offer='@json($offer)'
                 :current-user='@json(current_user()->shortInfo())'
            >
            </div>
        </div>
    </div>
</div>
