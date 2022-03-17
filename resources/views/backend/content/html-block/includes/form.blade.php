<ul class="nav nav-tabs mb-3" id="tabs" role="tablist">
    @foreach(array_keys(config('site-settings.locale.languages')) as $locale)
        <li class="nav-item" role="presentation">
            <a class="nav-link {{$locale === app()->getLocale() ? 'active' : ''}}" id="{{$locale}}-tab"
               data-bs-toggle="tab"
               href="#tab-{{$locale}}" type="button"
               role="tab">{{strtoupper($locale)}}
            </a>
        </li>
    @endforeach
</ul>
<div class="tab-content" id="tabs-content">
    @foreach(array_keys(config('site-settings.locale.languages')) as $locale)
        <div class="tab-pane fade {{$locale === app()->getLocale() ? 'show active' : ''}}" id="tab-{{$locale}}"
             role="tabpanel">
            <x-utils.form-group name="title_{{$locale}}" :label="__('Title')"
                                :value="old('title_'.$locale, $item->{'title_'.$locale})"
            ></x-utils.form-group>


            <x-utils.form-editor name="description_{{$locale}}" :label="__('Text')"
                                 id="description-{{$locale}}"
                                 :value="old('description_'.$locale, $item->{'description_'.$locale})"
            ></x-utils.form-editor>
        </div>
    @endforeach
</div>



