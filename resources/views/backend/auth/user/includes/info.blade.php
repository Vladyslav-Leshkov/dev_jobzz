<div class="d-flex align-items-center">
    @if(!$model->trashed())
        <a href="{{route('admin.user.show', $model)}}" class="me-2">
            <img src="{{$model->avatar_url}}" class="avatar rounded-circle image-cover"
                 alt="{{$model->last_name}} {{$model->first_name}}">
        </a>
        <div>
            <a class="text-nowrap mb-1"
               href="{{route('admin.user.show', $model)}}">{{$model->last_name}} {{$model->first_name}}</a>
        </div>
    @else
        <span class="me-2"> <img src="{{$model->avatar_url}}" class="avatar rounded-circle image-cover"
                                 alt="{{$model->last_name}} {{$model->first_name}}"></span>
        <div>
            <span class="text-nowrap mb-1">{{$model->last_name}} {{$model->first_name}}</span>
        </div>
    @endif
</div>
