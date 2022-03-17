@props([
    'name' => '',
    'value' => '',
    'label'=>'',
    'placeholder' => '',
    'type'=>'text',
    'options'=>[],
    'imgstyle'=>'height: 200px;'
])

<div class="form-group row mb-3 uploader-wrapper">
    <label for="{{$name}}" class="col-md-2 col-form-label">@lang($label)</label>

    <div class="col-md-10">
        @if(isset($attributes['class']) && str_contains($attributes['class'], 'image-uploader'))
        <div class="img-thumbnail-wrp">
            <img src="{{!empty($value) ? storage_url($value) : '/img/no-image.png'}}" alt="{{__($label)}}" style="{{$imgstyle}}" class="img-thumbnail mb-3">
            <a href="#" class="text-danger clear-image {{!empty($value) ? 'd-block': 'd-none'}}"><i class="fa fa-times"></i></a>
        </div>

        @endif
        <input type="hidden" name="{{$name}}" value="{{!empty($value) ? $value : ''}}" class="old-file">
        <input type="file" id="{{$name}}" name="{{$name}}_upload" {{ $attributes->merge(['class' => 'form-control']) }}>
        @error($name)
        <div class="invalid-feedback">
            {{$message}}
        </div>
        @enderror

    </div>
</div><!--form-group-->

