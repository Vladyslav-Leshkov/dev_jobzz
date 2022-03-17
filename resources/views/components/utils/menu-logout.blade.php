@props(['linkClass'=>'dropdown-item', 'id'=>'logout-form'])
<li {{$attributes}}>
    <a class="{{$linkClass}}" href="{{ route('frontend.auth.logout') }}"
       onclick="event.preventDefault();
               document.getElementById('{{$id}}').submit();"
    >
        {{ __('header.logout') }}
    </a>
    <form id="{{$id}}" action="{{ route('frontend.auth.logout') }}" method="POST" class="d-none">
        @csrf
    </form>
</li>
