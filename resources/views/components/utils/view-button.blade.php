@props(['href' => '#', 'text'=>__('View'), 'title'=>__('View'), 'permission' => false])

<x-utils.link :href="$href" {{$attributes->merge(['class'=>'btn btn-outline-info btn-sm'])}} :title="$title" icon="fas fa-eye" :text="$text" permission="{{ $permission }}" />
