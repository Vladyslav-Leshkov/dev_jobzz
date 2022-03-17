@extends('frontend.layout.app')

@section('title', __('Closing a vacancy'))


@section('content')
    <div class="container pt-50 mb-50 mb-lg-100">
        @if($offers->count() > 0)
            <div class="page-title mb-30">{{__('Please indicate which of the candidates you hired')}}</div>
            @foreach($offers as  $offer)
                <x-vacancy.candidate class="mb-20 mw-960"
                                     :vacancy="$vacancy"
                                     :offer="$offer"
                                     :candidate="$offer->candidate"
                ></x-vacancy.candidate>
            @endforeach
        @else
            <div class="alert alert-secondary font-16">{{__('No candidates found for this vacancy')}}</div>
        @endif


    </div>
@endsection
