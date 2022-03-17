@props(['type' => 'primary', 'color'=>'white', 'autohide'=>true, 'delay'=>100000])

<div class="toast hide d-flex align-items-center text-{{$color}} bg-{{$type}} border-0" data-delay="{{$delay}}"
     role="alert" aria-live="assertive" aria-atomic="true">
    <div class="toast-body">
        {{$slot}}
    </div>
    <button type="button" class="btn-close btn-close-white ms-auto me-2" data-bs-dismiss="toast"
            aria-label="@lang('Close')"></button>
</div>
