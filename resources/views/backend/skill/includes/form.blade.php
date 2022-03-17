

<x-forms.text-group name="title_ru" :label="__('Title RU')" :value="old('title_ru', $skill->title_ru)" maxlength="100" required></x-forms.text-group>
<x-forms.text-group name="title_en" :label="__('Title EN')" :value="old('title_en', $skill->title_en)" maxlength="100" required></x-forms.text-group>
<x-forms.text-group name="slug" :label="__('Key')" :value="old('slug', $skill->slug)" maxlength="100"
                    help="Оставьте пустым для автоматической генерации"></x-forms.text-group>

