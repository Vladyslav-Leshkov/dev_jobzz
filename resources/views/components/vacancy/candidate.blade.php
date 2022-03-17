@props([
    'vacancy'=>new \App\Models\Job\Vacancy(),
    'candidate'=>new \App\Models\Auth\User(),
    'offer'=>new \App\Models\Job\Offer()
])
<div {{$attributes->merge(['class'=>'profile-item card'])}}>
    <div class="p-15 p-xl-25">
        <div class="row">
            <div class="col-12 col-lg-auto">
                <div class="profile-avatar w-auto">
                    <img src="{{$candidate->avatar_url}}" alt="{{$candidate->name}}">
                </div>
            </div>
            <div class="col-12 col-lg">
                <div class="d-flex justify-content-between flex-column align-items-center flex-lg-row ">
                    <div class="text-start">
                        <div class="profile-title">{{$candidate->name}}</div>
                        <div class="font-18 fw-bold text-primary">{{$candidate->position}}</div>
                    </div>
                    @if($candidate->deleted_at === null)
                        <div v-is="'vacancy-hiring-btn'"
                             class="d-none d-lg-block"
                             :offer='@json($offer)'
                        ></div>
                    @endif
                </div>
                <hr>
                <div class="profile-meta mb-15">
                    <div class="meta-item">
                        <div class="meta-title">{{__('Location')}}</div>
                        <div class="meta-value">{!! $candidate->candidate_profile->location_title ?? 'N/A' !!}</div>
                    </div>
                    <div class="meta-item">
                        <div class="meta-title text-nowrap">{{__('Work experience')}}</div>
                        <div class="meta-value text-nowrap">{{$candidate->candidate_profile->experience_title?? 'N/A' }}</div>
                    </div>
                    <div class="meta-item">
                        <div class="meta-title text-nowrap">{{__('English level')}}</div>
                        <div class="meta-value text-nowrap">{{$candidate->candidate_profile->english_title?? 'N/A' }}</div>
                    </div>
                </div>

                <div class="d-flex d-lg-none justify-content-center">
                    <div v-is="'vacancy-hiring-btn'"
                         :offer='@json($offer)'
                    ></div>
                </div>

            </div>
        </div>
    </div>

</div>
