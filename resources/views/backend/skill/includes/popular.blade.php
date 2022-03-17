<x-form.ajax-switch  :id="'model-'.$model->id" :checked="$model->popular === 1" :url="route('admin.skill.update', $model)" :property="'popular'" />
