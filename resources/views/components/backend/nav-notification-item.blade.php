<a href="{{$message->url}}" class="list-group-item">
    <div class="row g-0 align-items-center">
        <div class="col-2">
            <i class="text-{{$message->type}}" data-feather="{{$message->icon}}"></i>
        </div>
        <div class="col-10">
            <div class="text-dark">{{$message->text}}</div>
            <div class="text-muted small mt-1">{{$message->time}}</div>
        </div>
    </div>
</a>
