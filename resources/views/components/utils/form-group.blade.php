@props([
    'name' => '',
    'value' => '',
    'label'=>'',
    'placeholder' => '',
    'type'=>'text',
    'readonly'=>false,
    'help'=>'',
    'options'=>[],
    'rows'=>10
    ])

<div class="form-group row mb-3">
    <label for="{{$name}}" class="col-md-2 col-form-label">{{$label}}@if(isset($attributes['required'])) <span
                class="text-danger">*</span>@endif</label>

    <div class="col-md-10">
        @if($type === 'textarea')
            <textarea name="{{$name}}"
                      id="{{$name}}"
                      rows="{{$rows}}"
                      {{$readonly ? 'readonly' : ''}}
                      placeholder="{{ !empty($placeholder) ? $placeholder : $label}}"
                      {{ $attributes->merge(['class' => 'form-control']) }}
            >{{ $value }}</textarea>
        @elseif($type === 'select')
            <select name="{{$name}}"
                    id="{{$name}}"
                    {{$readonly ? 'readonly' : ''}}
                    {{ $attributes->merge(['class' => 'form-control']) }}
            >
                @foreach($options as $option)
                    <option value="{{ $option['value']}}" {{$option['value'] === $value ? 'selected' : ''}}>{{ $option['text']}}</option>
                @endforeach

            </select>
        @elseif($type === 'checkbox')

            <div class="form-check mt-1">
                <input
                        type="checkbox"
                        name="{{$name}}"
                        id="{{$name}}"
                        value="{{$value}}"
                        class="form-check-input"
                        {{$readonly ? 'readonly' : ''}}
                        {{ $attributes->merge(['class' => 'form-check-input']) }}
                        {{ old($name) ? 'checked' : '' }} />
            </div><!--form-check-->

        @else
            <input name="{{$name}}"
                   id="{{$name}}"
                   placeholder="{{ !empty($placeholder) ? $placeholder : $label }}"
                   value="{{ $value}}"
                    {{$readonly ? 'readonly' : ''}}
                    {{ $attributes->merge(['class' => 'form-control', 'type'=>$type]) }}
            />
        @endif
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
