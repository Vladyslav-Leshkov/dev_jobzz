@extends('frontend.layout.app')

@section('title', __('Candidate profile'))


@section('content')
    <div class="container pt-30 pt-lg-50">
        <x-candidate.item :item="$profile">
            @if(current_user() && current_user()->isRecruiter())
                <hr class="mb-50">
                @if(is_moderate())
                    <div class="mb-50">
                        <div class="btn btn-outline-danger btn-lg rounded-pill disabled">@lang('Profile on moderation')</div>
                    </div>

                @else
                    <x-candidate.offer-vacancy :profile='$profile'></x-candidate.offer-vacancy>
                @endif
            @endif
        </x-candidate.item>
    </div>
@endsection
