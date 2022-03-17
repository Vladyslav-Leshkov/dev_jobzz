@props([
    'name' => '',
    'id' => null,
    'checked' => false,
    'label'=>'',
    'active_value'=>1,
    'inactive_value'=>0,
    ])
<div {{$attributes->merge(['class'=>'form-check'])}}>
    <input type="hidden" name="{{$name}}" value="{{$inactive_value}}">
    <input class="form-check-input" name="{{$name}}" type="checkbox" value="{{$active_value}}" id="{{$id ?? $name}}" {{$checked ? 'checked' : ''}}>
    <label class="form-check-label" for="{{$id ?? $name}}" >{{$label}}</label>
</div>
