@props([
    'url'=>'',
    'property'=>'',
    'id'=>'',
    'checked'=>false
])
<div wire:ignore class="form-check form-switch ajax-switch" data-url="{{$url}}" data-property="{{$property}}">
    <input class="form-check-input" type="checkbox" id="{{$id}}" {{$checked ? 'checked' : ''}}>
    <label class="form-check-label" for="{{$id}}"></label>
</div>
