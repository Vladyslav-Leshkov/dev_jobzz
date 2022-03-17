@extends('frontend.layout.app')

@section('title', __('Job Categories'))


@section('content')
    <x-page.head class="mb-30 mb-lg-50">{{__('Job Categories')}}</x-page.head>
    <div class="container">
        @foreach($spec_types as $category)
            <x-spec.category :category="$category" :items="$category->items" :show-all="false"
                             class="mb-70"></x-spec.category>
        @endforeach
    </div>
@endsection

