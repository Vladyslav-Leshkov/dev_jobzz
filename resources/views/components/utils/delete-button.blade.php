@props(['href' => '#', 'text' => __('Delete'), 'title' => __('Delete'), 'permission' => false, 'onsubmit'=>__('Are you sure you want to delete this entry?')])

<x-utils.form-button
    :action="$href"
    method="delete"
    name="delete-item"
    :title="$title"
    button-class="btn btn-outline-danger btn-sm"
    permission="{{ $permission }}"
    :onsubmit="$onsubmit"
>
    <i class="fas fa-trash"></i> {{ $text }}
</x-utils.form-button>
