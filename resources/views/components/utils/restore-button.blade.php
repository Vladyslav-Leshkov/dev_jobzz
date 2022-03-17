@props(['href' => '#', 'text' => __('Restore'), 'title' => __('Restore'), 'permission' => false])

<x-utils.form-button
    :action="$href"
    method="post"
    name="restore-item"
    :title="$title"
    button-class="btn btn-outline-warning btn-sm"
    permission="{{ $permission }}"
>
    <i class="fas fa-trash-restore"></i> {{ $text }}
</x-utils.form-button>
