@props(['name' => '', 'active' => false,  'label'=>'', 'active_value'=>1, 'inactive_value'=>0,  'help'=>'', 'options'=>[]])
<div class="form-group row mb-3 align-items-center">
    <div class="m-0 col-md-3 col-form-label">
        <span class="form-check-label">{{$label}}</span>
    </div>
    <div class="m-0 col-md-9">
        <div class="form-check form-switch ms-4">
            <input type="hidden" name="{{$name}}" value="{{$inactive_value}}">
            <input class="form-check-input" {{$active ? 'checked' : ''}} name="{{$name}}" value="{{$active_value}}" type="checkbox" id="{{$name}}">
            <label class="form-check-label" for="{{$name}}"></label>
        </div>
        @if(!empty($help))
            <div class="form-text">{{$help}}</div>
        @endif
    </div>
</div>
