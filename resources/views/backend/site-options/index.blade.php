@extends('backend.layout.app')
@section('content')
    <div class="dashboard d-flex justify-content-between">
        <h1>@lang('Global settings')</h1>

    </div>

    <div class="card">
        <div class="card-body">
            <form class="form mb-3" action="{{route('admin.site-options.update')}}" method="POST">
                @csrf
                @method('PATCH')
                @foreach($site_options as $site_option)
                    <div class="row mb-2">
                        <label class="col-md-4 col-xl-3 mb-2">
                            {{$site_option->title}}
                        </label>
                        <div class="col-md-6 mb-2">
                            @switch($site_option->type)
                                @case('boolean')
                                <div class="form-check form-switch">
                                    <input type="hidden" name="options[{{$site_option->key}}]" value="0">
                                    <input class="form-check-input" name="options[{{$site_option->key}}]"
                                           value="1" type="checkbox"
                                           id="options_{{$site_option->key}}"
                                        {{$site_option->value ? 'checked' : ''}}>
                                    <label class="form-check-label" for="options_{{$site_option->key}}"></label>
                                </div>
                                @break
                                @case('text')
                                <textarea name="options[{{$site_option->key}}]" rows="8" class="form-control">{!! $site_option->value !!}</textarea>
                                @break
                                @default
                                <input  name="options[{{$site_option->key}}]" type="text" class="form-control" value="{{$site_option->value}}">
                            @endswitch

                        </div>
                    </div>

                @endforeach

                <button type="submit" class="btn btn-primary">@lang('Save')</button>
            </form>
        </div>
    </div>
@endsection
