@extends('frontend.layout.app')

@section('title', __('Account Deleting'))


@section('content')
    <div class="container pt-50 pt-lg-100 mb-50 mb-lg-100 agree-page">
        <form action='{{route('frontend.profile.delete.confirm')}}' method="POST"
              v-is="'candidate-delete-form'"
              :ask='{{$ask_a_question ? 'true' : 'false'}}'
              redirect-url='{{route('frontend.recruiter.confirm')}}'
        >
            @csrf
            @method('DELETE')
            <div class="page-title text-center mb-40">{{$textBlock->title}}</div>

            <div class="mb-40 text-center">
                {!! $textBlock->description !!}
            </div>

            <div class="mw-310 text-center mx-auto">
                <button class="btn btn-lg btn-primary btn-block mb-20 px-10 font-18" type="submit" name="confirm"
                        value="1">@lang('Yes, I confirm the complete deletion of the account.')</button>

            </div>

        </form>

    </div>

@endsection
