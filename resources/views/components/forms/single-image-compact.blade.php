@props([
    'name' => '',
    'value' => '',
    'label'=>'',
    'placeholder' => '',
    'type'=>'text',
    'options'=>[],
    'imgstyle'=>'height: 200px;'
])
<div class=" image-upload-group">
    <label  for="{{$name}}" class="img-thumbnail-wrp">
        <img src="{{!empty($value) ? $value : '/img/no-image.png'}}" alt="{{__($label)}}" style="{{$imgstyle}}" class="img-thumbnail mb-3">
        <a href="#" class="clear-image text-danger {{empty($value) ? 'd-none' : ''}}" title="@lang('Clear image')"><i data-feather="x"></i></a>
    </label>
    <input type="hidden" name="{{$name}}" class="old-file" value="{{!empty($value) ? $value : ''}}">
    <input accept=".jpg,.png,.gif" type="file" id="{{$name}}" name="{{$name.'_upload'}}" {{ $attributes->merge(['class' => 'form-control d-none']) }}>
    @error($name)
    <div class="invalid-feedback">
        {{$message}}
    </div>
    @enderror

</div>
