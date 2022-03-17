@props([
    'name' => '',
    'value' => [],
    'label'=>'',
    'placeholder' => '',
    'type'=>'text',
    'readonly'=>false,
    'help'=>'',
    'options'=>[]
])


<div class="form-group row mb-3">
    <label for="{{$name}}" class="col-md-3 col-form-label">@lang($label)@if(isset($attributes['required'])) <span
            class="text-danger">*</span>@endif</label>

    <div class="col-md-9">
        <select name="{{$name}}"
                id="{{$name}}"
                multiple
            {{$readonly ? 'readonly' : ''}}
            {{ $attributes->merge(['class' => 'form-control select-choices']) }}
        >
            @foreach($options as $option)
                <option
                    value="{{ $option['value']}}" {{in_array($option['value'], $value) ? 'selected' : ''}}>{{ $option['text']}}</option>
            @endforeach

        </select>

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

