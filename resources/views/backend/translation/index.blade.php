@extends('backend.layout.app')

@section('title', __('Translations'))

@section('content')
    <div class="mb-2">
        {!! breadcrumbs([
            ['url'=>route('admin.dashboard'), 'title'=>__('Home')],
            ['url'=>route('admin.translation.index'), 'title'=>__('Translations')],
        ]) !!}
    </div>
    <div class="d-flex justify-content-between">
        <h1>@lang('Translations')</h1>

        <div class="d-flex align-items-center">
            @if(current_user()->isMasterAdmin() && false)
                <a href="{{route('admin.translation.create')}}" class="btn btn-sm btn-outline-info"><i
                            data-feather="feather"></i> Добавить перевод</a>
            @endif
            @if(current_user()->isAdmin())
                <x-utils.form-button button-class="btn btn-sm btn-outline-primary"
                                     action="{{route('admin.translation.publish')}}">
                    Опубликовать перевод
                </x-utils.form-button>
            @endif
        </div>
    </div>

    <div class="card">
        <div class="card-body">

            <div v-is="'translation-editor'"
                 :locales='["en", "ru"]'
                 :params='@json(request()->all())'
                 :groups='@json($groups)'
            ></div>

        </div>
    </div>


@endsection
