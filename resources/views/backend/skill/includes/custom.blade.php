{{--<x-form.ajax-switch :id="'model-custom-'.$model->id" :checked="$model->is_custom === 1"--}}
{{--                    :url="route('admin.skill.update', $model)" :property="'is_custom'"/>--}}

{{$model->is_custom === 1 ? 'Да': 'Нет'}}
