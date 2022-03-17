@props([
    'message' => null,
])
@if($message !== null)
<a href="{{$message->url}}" class="list-group-item">
    <div class="row g-0 align-items-center">
        <div class="col-2">
            <img src="{{$message->user->avatarUrl}}" class="avatar img-fluid rounded-circle" alt="{{$message->user->name}}">
        </div>
        <div class="col-10 pl-2">
            <div class="text-dark">{{$message->user->name}}</div>
            <div class="text-muted small mt-1">{{$message->text}}</div>
            <div class="text-muted small mt-1">{{$message->time}}</div>
        </div>
    </div>
</a>
@endif
