
@extends('backend.layout.app')

@section('title', __('Skills'))

@section('content')
   <div v-is="'messenger'"
        page-title='{{__('Messages')}}'
        :current-user='@json($current_user)'
        :support-user='@json($support_user)'
        :contacts='@json($contacts)'
   ></div>
@endsection
