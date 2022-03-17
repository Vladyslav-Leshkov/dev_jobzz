@props([
    'name'=>'',
    'value'=>'',
    'label'=>'',
    'type'=>'text',
    'placeholder'=>''
])
<div {{$attributes->merge(['class' => 'form-group'])}} >
    <label for="{{$name}}" class="form-label {{$attributes->has('required') ? 'required' : ''}}">{{$label}}</label>
    <input class="form-control" type="{{$type}}" id="{{$name}}" name="{{$name}}" value="{{$value}}"
           placeholder="{{$placeholder}}" {{$attributes->has('required') ? 'required' : ''}}>
</div>
