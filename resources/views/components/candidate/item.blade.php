@props(['item'=> new App\Models\Job\CandidateProfile])
<div {{ $attributes->merge(['class' => 'profile-item']) }}>
    <div class="row">
        <div class="col-12">
            <div class="publish-date">@lang('candidate.publish-date') {{$item->created_at->format('d.m.Y')}}</div>
            <h1 class="profile-title">{{$item->position}}</h1>
            <div class="profile-activity">@lang('candidate.activity')
                <strong>{{ $item->user->last_activity ? $item->user->last_activity->diffForHumans() : '-'}}</strong>
            </div>
            <div class="profile-meta mb-15">
                <div class="meta-item">
                    <div class="meta-title">@lang('candidate.experience')</div>
                    <div class="meta-value">{{$item->experience_title}}</div>
                </div>
                <div class="meta-item">
                    <div class="meta-title">@lang('candidate.english-level')</div>
                    <div class="meta-value">{{$item->english_title}}</div>
                </div>
                @if(($item->is_freelance && $item->price_freelance > 0) || (!$item->is_freelance && $item->price_full_time > 0))
                    <div class="meta-item text-success">
                        <div class="meta-title">@lang('candidate.salary')</div>
                        <div class="meta-value">{{$item->is_freelance ? $item->price_freelance_title : $item->price_title}}</div>
                    </div>
                @endif
                <div class="meta-item">
                    <div class="meta-title">@lang('candidate.location')</div>
                    <div class="meta-value">{!! $item->location_title !!}</div>
                </div>
            </div>
            <hr class="mw-1200">
            @if($item->employment_types->count() > 0)
                <div class="mb-20">
                    <div class="profile-subtitle font-23">@lang('candidate.work-options')</div>
                    <div class="profile-badges">
                        @foreach($item->employment_types as $employment_type)
                            <div class="badge rounded-pill bg-primary badge-md me-10">{{$employment_type->title}}</div>
                        @endforeach
                    </div>
                </div>
            @endif
            @if($item->skills->count() > 0)
                <div class="mb-40">
                    <div class="profile-subtitle font-23">@lang('candidate.skills')</div>
                    <div class="profile-badges">
                        @foreach($item->skills as $skill)
                            <div class="badge rounded-pill bg-white badge-md me-10">{{$skill->title}}</div>
                        @endforeach
                    </div>
                </div>
            @endif
            @if($item->additional_skills()->count() > 0)
                <div class="mb-20">
                    <div class="profile-subtitle font-23">@lang('candidate.additional-skills')</div>
                    <div class="profile-badges">
                        @foreach($item->additional_skills as $skill)
                            <div class="badge rounded-pill bg-white badge-md me-10">{{$skill->title}}</div>
                        @endforeach
                    </div>
                </div>
            @endif
            @if(!empty($item->description))
                <div class="mb-50">
                    <div class="profile-title mb-20">@lang('candidate.description')</div>
                    <div class="profile-description mw-1200">
                        {!! nl2br($item->description) !!}
                    </div>
                </div>
            @endif

            {{$slot ?? ''}}
        </div>
    </div>
</div>
