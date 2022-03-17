<x-forms.select-group name="type_id" :label="__('Type')" :value="old('type_id', $specialization->type_id)"
                      :options="$types"/>

<x-forms.text-group name="title_ru" :label="__('Title RU')" :value="old('title_ru', $specialization->title_ru)"
                    maxlength="100" required></x-forms.text-group>
<x-forms.text-group name="title_en" :label="__('Title EN')" :value="old('title_en', $specialization->title_en)"
                    maxlength="100" required></x-forms.text-group>
<x-forms.text-group name="slug" :label="__('Key')" :value="old('slug', $specialization->slug)" maxlength="100"
                    help="Оставьте пустым для автоматической генерации"></x-forms.text-group>


<x-forms.single-image-upload name="logo" label="Логотип" :value="old('slug', $specialization->logo)" :storage="true"/>


<x-forms.tag-group label="Рекомендуемые скилы" name="skills[]" :value="$specialization->skills->pluck('id')->toArray()"
                   :options="$skills"
></x-forms.tag-group>
