@extends('frontend.layout.app')

@section('title', __('Preview Profile'))


@section('content')
    <div class="page-header mb-30 mb-lg-50 pb-25">
        <div class="container-fluid container-lg">
            <div class="page-header-body">
                <h1 class="page-header-title mb-5"><span>{{__('Preview Profile')}}</span></h1>
                <div class="page-header-action">
                    <a href="{{current_user()->isActive() ? route('frontend.profile.index') :route('frontend.profile.wizard', ['step'=>2])  }}">
                        @lang('Back to editing')
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid container-lg">
        @if($user->isCandidate())
            <x-candidate.item :item="$model"></x-candidate.item>
        @endif
    </div>



@endsection
