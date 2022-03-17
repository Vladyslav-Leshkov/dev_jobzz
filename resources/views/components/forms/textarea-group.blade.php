@props([
    'name' => '',
    'value' => '',
    'label'=>'',
    'placeholder' => '',
    'type'=>'text',
    'readonly'=>false,
    'help'=>'',
    'labelCol'=>'col-md-3',
    'inputCol'=>'col-md-9',
])

<div class="form-group row mb-3">
    <label for="{{$name}}" class="{{$labelCol}} col-form-label">@lang($label)@if(isset($attributes['required'])) <span class="text-danger">*</span>@endif</label>

    <div class="{{$inputCol}}">
         <textarea name="{{$name}}"
                   id="{{$name}}"
                   {{$readonly ? 'readonly' : ''}}
                   placeholder="{{ !empty($placeholder) ? $placeholder : $label}}"
                      {{ $attributes->merge(['class' => 'form-control']) }}
            >{{ $value }}</textarea>
        @if(!empty($help))
            <div class="form-text">{{$help}}</div>
        @endif
        @error($name)
            <div class="invalid-feedback">
                {{$message}}
            </div>
        @enderror

    </div>
</div><!--form-group-->
