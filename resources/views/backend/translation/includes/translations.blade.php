@foreach($locales as $locale_key=>$locale_value)
    <div>
        <b>{{$locale_value['short_name']}}:</b>
        <i>{{ $language_line->hasTranslation($locale_key) ? $language_line->getTranslation($locale_key) : ''}}</i>
    </div>
@endforeach
