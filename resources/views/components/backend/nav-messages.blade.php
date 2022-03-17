<li class="nav-item dropdown">
    <a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown" data-bs-toggle="dropdown">
        <div class="position-relative">
            <i class="align-middle" data-feather="message-square"></i>
                @if(count($messages) > 0)<span class="indicator">{{count($messages)}}</span>@endif
        </div>
    </a>
    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="messagesDropdown">
        <div class="dropdown-menu-header">
            <div class="position-relative">
                {{count($messages)}} @choice('New Message|New Messages', count($messages))
            </div>
        </div>
        <div class="list-group">
            @foreach($messages as $message)
            <x-backend.nav-message-item :message="$message" />
            @endforeach
        </div>
        <div class="dropdown-menu-footer">
            <a href="#" class="text-muted">@lang('Show all messages')</a>
        </div>
    </div>
</li>
