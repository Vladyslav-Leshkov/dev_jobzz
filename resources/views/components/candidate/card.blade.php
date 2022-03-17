@props(['item'=> new App\Models\Job\CandidateProfile])
<div {{ $attributes->merge(['class' => 'profile-item']) }}>
    <div>
        <div class="publish-date">@lang('candidate.publish-date') {{$item->created_at->format('d.m.Y')}}</div>
        <a href="{{$item->url}}" class="profile-title">{{$item->position}}</a>
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
        <hr class="mw-640">
        @if($item->skills->count() > 0)
            <div class="mb-20">
                <div class="profile-subtitle">@lang('candidate.skills')</div>
                <div class="profile-badges">
                    @foreach($item->skills as $skill)
                        <div class="badge rounded-pill bg-secondary badge-md me-10">{{$skill->title}}</div>
                    @endforeach
                </div>
            </div>
        @endif
        @if($item->skills->count() === 0 && $item->additional_skills->count() > 0)
            <div class="mb-20">
                <div class="profile-subtitle">@lang('candidate.additional-skills')</div>
                <div class="profile-badges">
                    @foreach($item->additional_skills as $skill)
                        <div class="badge rounded-pill bg-white badge-md me-10">{{$skill->title}}</div>
                    @endforeach
                </div>
            </div>
        @endif
        @if(!empty($item->description))
            <div class="mb-0">
                <div class="profile-subtitle font-22 mb-10">@lang('candidate.about')</div>
                <div class="profile-description">
                    {!! nl2br(str_limit($item->description, 500)) !!}
                </div>
            </div>
        @endif
    </div>
</div>
