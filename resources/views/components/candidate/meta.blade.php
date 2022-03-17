@props([
    'item'=>[],
    'salary'=>true
])
<div class="profile-meta mb-15">
    <div class="meta-item">
        <div class="meta-title">@lang('candidate.experience')</div>
        <div class="meta-value">{{$item->experience_title}}</div>
    </div>
    <div class="meta-item">
        <div class="meta-title">@lang('candidate.english-level')</div>
        <div class="meta-value">{{$item->english_title}}</div>
    </div>
    @if($salary)
    <div class="meta-item text-success">
        <div class="meta-title">@lang('candidate.salary')</div>
        <div class="meta-value">{{$item->price_title}}</div>
    </div>
    @endif
    <div class="meta-item">
        <div class="meta-title">@lang('candidate.location')</div>
        <div class="meta-value">{!! $item->location_title !!}</div>
    </div>
</div>
