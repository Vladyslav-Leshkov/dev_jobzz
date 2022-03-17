@props([
    'action' => '#',
    'method' => 'POST',
    'name' => '',
    'formClass' => 'd-inline',
    'buttonClass' => '',
    'icon' => false,
    'permission' => false,
    'onsubmit'=>'',
    'title'=>'',
    'tooltip'=>false,
])

@if ($permission)
    @if (current_user()->can($permission))
        <form method="POST" action="{{ $action }}" name="{{ $name }}" class="{{ $formClass }}" data-onsubmit-message="{{$onsubmit}}">
            @csrf
            @method($method)

            <button type="submit" {{$tooltip ? 'data-bs-toggle="tooltip"' : ''}} data-bs-placement="top" title="{{$title}}" class="{{ $buttonClass }}">
                @if ($icon)<i class="{{ $icon }}"></i> @endif{{ $slot }}
            </button>
        </form>
    @endif
@else
    <form method="POST" action="{{ $action }}" name="{{ $name }}" class="{{ $formClass }}" data-onsubmit-message="{{$onsubmit}}">
        @csrf
        @method($method)

        <button type="submit" {{$tooltip ? 'data-bs-toggle="tooltip"' : ''}} data-bs-placement="top"  title="{{$title}}" class="{{ $buttonClass }}">
            @if ($icon)<i class="{{ $icon }}"></i> @endif{{ $slot }}
        </button>
    </form>
@endif
