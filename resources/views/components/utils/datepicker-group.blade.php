@props(['name' => '', 'value' => '', 'label'=>'',  'placeholder' => '', 'type'=>'text', 'options'=>[]])

<div class="form-group row mb-3 date-picker-group" x-data="{date: '{{$value}}'}">
    <label for="{{$name}}" class="col-md-2 col-form-label">@lang($label)</label>

    <div class="col-md-10">
        <div class="input-group flatpicker">
            <span class="input-group-text" ><i class="fa fa-calendar-alt"></i></span>
            <input  name="{{$name}}"
                    data-input
                    id="{{$name}}"
                    placeholder="{{ __(!empty($placeholder) ? $placeholder : $label) }}"
                    value="{{ $value}}"
                    x-on:change="date = $event.target.value"
                {{ $attributes->merge(['class' => 'form-control', 'type'=>$type]) }} />
            <span x-show="date" class="input-group-text" data-clear><i class="fa fa-times"></i></span>
        </div>


        @error($name)
        <div class="invalid-feedback">
            {{$message}}
        </div>
        @enderror

    </div>
</div><!--form-group-->

