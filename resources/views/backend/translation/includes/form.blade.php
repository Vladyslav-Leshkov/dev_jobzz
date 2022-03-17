<x-forms.text-group name="group" :label="__('Group')" required :value="$line->group"
                    :readonly="$line->id > 0"></x-forms.text-group>
<x-forms.text-group name="key" :label="__('Key')" required :value="$line->key"
                    :readonly="$line->id > 0"></x-forms.text-group>

@foreach($languages as $locale=>$language)
    <x-forms.text-group name="text[{{$locale}}]" :label="$language['short_name']" required
                        :value="$line->hasTranslation($locale) ? $line->getTranslation($locale) : ''"
                        placeholder="{{$line->getTranslation($locale)}}"></x-forms.text-group>
@endforeach


<input type="hidden" name="return_to" value="{{route('admin.translation.index', request()->all())}}">
