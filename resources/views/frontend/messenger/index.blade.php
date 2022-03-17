@extends('frontend.layout.app')

@section('title', __('My Messages'))


@section('content')
    <div v-is="'messenger'"
         page-title='{{__('My Messages')}}'
         :current-user='@json($current_user)'
         :support-user='@json($support_user)'
         :contacts='@json($contacts)'
    ></div>
@endsection
