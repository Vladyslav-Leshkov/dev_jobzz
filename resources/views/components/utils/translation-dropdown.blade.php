<form action="{{request()->url()}}?{{http_build_query(request()->except(['trans_locale']))}}" id="locale_form">
    <div class="form-group d-flex align-items-center me-3">
        <label for="trans_locale" class="me-2">@lang('Translation')</label>
        <select name="trans_locale" id="trans_locale" class="form-control form-control-sm" onchange="document.getElementById('locale_form').submit()">
            @foreach($site_languages as $locale=>$language)
                <option value="{{$locale}}" {{$locale === $trans_locale ? 'selected' : ''}}>{{$language['short_name']}}</option>
            @endforeach
        </select>
    </div>
</form>

