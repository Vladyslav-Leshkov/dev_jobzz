
@extends('backend.layout.app')

@section('title', __('Payouts'))

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.recruiter.index'), 'title'=>__('Recruiters')],
            ['url'=>route('admin.recruiter.show', $user), 'title'=>$user->name],
            ['url'=>route('admin.recruiter.payouts', $user), 'title'=>__('Payouts')],
        ]) !!}
    </div>
    <div class="d-flex justify-content-between">
        <h1>{{$user->name }} - @lang('Payouts')</h1>

        <div>
            <a href="{{route('admin.recruiter.index')}}">Назад к списку</a>
        </div>
    </div>

    <div class="card">
        <div class="card-body">
            <livewire:backend.users-payouts-table :user="$user" />
        </div>
    </div>
@endsection
