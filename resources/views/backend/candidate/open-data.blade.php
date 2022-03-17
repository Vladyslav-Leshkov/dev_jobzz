@extends('backend.layout.app')

@section('title', __('candidate.title').' - '.$user->name)

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.candidate.index'), 'title'=>__('Candidates')],
            ['url'=>route('admin.candidate.show', $user), 'title'=>$user->name],
            ['url'=>route('admin.candidate.open-data', $user), 'title'=>'Открыл контакты'],
        ]) !!}
    </div>

    <div class="d-flex justify-content-between">
        <h2> {{__('candidate.title').' - '.$user->name}} - Открыл контакты</h2>
        <div>
            <x-utils.link class="btn btn-sm btn-outline-secondary"
                          :href="route('admin.candidate.index')"
                          :text="__('Back')"/>
        </div>
    </div>

    <x-backend.card>

        <x-slot name="body">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Дата предложения</th>
                    <th>Рекрутер</th>
                    <th>Вакансия</th>
                    <th>Инициатор</th>
                    <th>Дата выхода на работу</th>
                    {{--                    <th>Статус</th>--}}
                </tr>
                </thead>
                <tbody>
                @foreach($offers as $offer)
                    <tr>
                        <td>{{$offer->created_at->timezone(config('app.correct_timezone'))->format('d.m.Y H:m')}}</td>
                        <td>
                            @include('backend.recruiter.includes.info', ['model'=>$offer->recruiter])
                        </td>
                        <td>
                            @if($offer->vacancy)
                                <a href="{{$offer->vacancy->url}}">{{$offer->vacancy->title}}</a>
                            @endif
                        </td>
                        <td>
                            {{$offer->initiator == 0 ? 'Кандидат' : 'Рекрутер'}}
                        </td>
                        <td>
                            {{empty($offer->released_to_work) ? '-' : $offer->released_to_work->format('d.m.Y')}}
                        </td>
                        {{--                        <td>--}}
                        {{--                            @if($offer->confirmed)--}}
                        {{--                                @if($offer->payment_status === 0)--}}
                        {{--                                    <span class="badge bg-warning">Не оплачен</span>--}}
                        {{--                                @else--}}
                        {{--                                    <span class="badge bg-success">Оплачен</span>--}}
                        {{--                                @endif--}}
                        {{--                            @else--}}
                        {{--                                <span class="badge bg-secondary">Ожидает подтверждения</span>--}}
                        {{--                            @endif--}}

                        {{--                        </td>--}}
                    </tr>
                @endforeach
                </tbody>
            </table>
        </x-slot>

    </x-backend.card>
@endsection
