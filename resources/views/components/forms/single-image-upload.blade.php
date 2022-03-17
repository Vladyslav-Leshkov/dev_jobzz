@props([
    'name' => '',
    'value' => '',
    'label'=>'',
    'placeholder' => '',
    'type'=>'text',
    'options'=>[],
    'storage'=>false,
    'imgstyle'=>'height: 200px;',
    'labelColClass'=>'col-md-3',
    'inputColClass'=>'col-md-9'
])

<div class="form-group row mb-3 image-upload-group">
    <div class="{{$labelColClass}} col-form-label">@lang($label)</div>

    <div class="{{$inputColClass}}">

        <label for="{{$name}}" class="img-thumbnail-wrp">
            <img src="{{!empty($value) ? ($storage ? storage_url($value) : $value) : '/img/no-image.png'}}"
                 alt="{{__($label)}}" style="{{$imgstyle}}" class="img-thumbnail mb-3">
            <a href="#" class="clear-image text-danger {{empty($value) ? 'd-none' : ''}}"
               title="@lang('Clear image')"><i data-feather="x"></i></a>
        </label>
        <input type="hidden" name="{{$name}}" class="old-file" value="{{!empty($value) ? $value : ''}}">
        <input accept=".jpg,.png,.gif" type="file" id="{{$name}}"
               name="{{$name.'_upload'}}" {{ $attributes->merge(['class' => 'form-control']) }}>
        @error($name)
        <div class="invalid-feedback">
            {{$message}}
        </div>
        @enderror

    </div>
</div><!--form-group-->


