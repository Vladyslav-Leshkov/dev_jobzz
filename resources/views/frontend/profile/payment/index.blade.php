@extends('frontend.layout.app')

@section('title', __('payment.title'))


@section('content')
    {{--    <x-page.head class="mb-30 mb-lg-50">{{__('payment.title')}}</x-page.head>--}}

    <div class="container py-60 py-lg-100">
        <div class="row gx-xl-5">
            <div class="col-12  col-xl-2 col-xxl-3 order-xl-last">
                {{--                <div v-is="'candidate-hiring-form'" class="mt-60"></div>--}}
            </div>
            <div class="col-12 col-xl-10 col-xxl-9">
                <form action="{{route('frontend.profile.payment.index')}}"
                      class=" mb-50 mb-lg-100"
                      v-is="'candidate-payment-form'"
                      :items='@json($pending_items)'
                >
                    @csrf
                </form>

                <div v-is="'candidate-payment-archive'"
                     class="mb-50"
                     :items='@json($archive_items)'
                ></div>
            </div>
        </div>

    </div>
@endsection
