@extends('frontend.layout.app')

@section('title',__('Categories by type').' '.$type->title)


@section('content')
    {{--    <x-page.head class="mb-30 mb-lg-50">{{__('Categories by type').' '.$type->title}}</x-page.head>--}}
    <div class="container pt-50">
        <x-spec.category :category="$type" :items="$items" :show-all="false" class="mb-70"
                         :single="true"></x-spec.category>
    </div>
@endsection

