@props(['titleClass'=>''])
<div {{$attributes->merge(['class'=>'page-header'])}}>
    <div class="container">
        <div class="page-header-body">
            <h1 class="page-header-title {{$titleClass}}">{{ $slot }}</h1>
            <x-slot name="actions"></x-slot>
        </div>
    </div>
</div>
