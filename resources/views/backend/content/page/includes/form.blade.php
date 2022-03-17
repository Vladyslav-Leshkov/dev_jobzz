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
            <x-utils.form-group name="title[{{$locale}}]" :label="__('Title')"
                                :value="old('title', $page->getTranslation('title', $locale))"
                                maxlength="100"
                                required></x-utils.form-group>

            <x-utils.form-group name="slug" :label="__('Url')" :value="old('slug', $page->slug)" maxlength="100"
                                :readonly="(!empty($page->slug) && $trans_locale !== app()->getLocale() )"
                                :help="__('Leave blank for automatic generation')"
            ></x-utils.form-group>

            <x-utils.form-group name="seo_h1[{{$locale}}]" :label="__('Seo H1')"
                                type="textarea" rows="2"
                                :value="old('seo_h1', $page->getTranslation('seo_h1', $locale))"></x-utils.form-group>
            <x-utils.form-group name="seo_title[{{$locale}}]" :label="__('Seo Title')"
                                :value="old('seo_title', $page->getTranslation('seo_title', $locale))"></x-utils.form-group>
            <x-utils.form-group name="seo_description[{{$locale}}]" :label="__('Seo Description')"
                                :value="old('seo_description', $page->getTranslation('seo_description', $locale))"></x-utils.form-group>
            <x-utils.form-group name="seo_keywords[{{$locale}}]" :label="__('Seo Keywords')"
                                :value="old('seo_keywords', $page->getTranslation('seo_keywords', $locale))"></x-utils.form-group>

            <x-utils.form-editor name="text[{{$locale}}]" :label="__('Text')"
                                 id="text-{{$locale}}"
                                 :value="old('text', $page->getTranslation('text', $locale))"></x-utils.form-editor>
        </div>
    @endforeach
</div>



