<div class="d-flex align-items-center">
    <a href="{{route('admin.recruiter.show', $model->id)}}" class="me-2">
        <img src="{{$model->avatar_url}}" class="avatar rounded-circle image-cover" alt="{{$model->name}}">
    </a>
    <div>
        <div class="mb-1text-nowrap">
            @if($model->id> 0)
                <a class="me-2" href="{{route('admin.recruiter.show', $model->id)}}">{{$model->name}}</a>
                <span class="text-muted">&nbsp;ID{{$model->id}}</span>
            @else
                <span class="me-2">{{$model->name}}</span>
            @endif
        </div>
        <div>{{$model->company ? $model->company->title : ''}}</div>
    </div>
</div>
