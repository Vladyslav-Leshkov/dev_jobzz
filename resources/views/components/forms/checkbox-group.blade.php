@props(['name' => '', 'value' => '', 'label'=>'', 'options'=>[]])
<div class="form-group row mb-3 align-items-center">
    <div class="m-0 col-md-3 col-form-label">
        <span class="form-check-label">{{$label}}</span>
    </div>
    <div class="m-0 col-md-9">
        @foreach($options as $option)
            @php
                $option_value = is_string($option) ? $option : $option['value'];
                $option_text = is_string($option) ? $option : $option['text'];
                $option_key = str_slug($name.'-'.$option_value)
            @endphp
            <div class="form-check ms-4">
                <input class="form-check-input" {{ (is_array($value) ?  in_array($option_value, $value) :  $option_value == $value) ? 'checked' : ''}} name="{{$name}}"
                       value="{{$option_value}}" type="checkbox" id="{{$option_key}}">
                <label class="form-check-label" for="{{$option_key}}">{{$option_text}}</label>
            </div>
        @endforeach
    </div>
</div>

