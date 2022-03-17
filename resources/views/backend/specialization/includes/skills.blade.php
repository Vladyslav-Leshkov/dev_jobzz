@foreach($model->skills as $skill)
    <span class="badge bg-secondary mb-1 me-2">{{$skill->title}}</span>
@endforeach
