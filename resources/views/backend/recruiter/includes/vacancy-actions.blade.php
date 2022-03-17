<a href="{{route('admin.recruiter.vacancy.show', [$model->user_id, $model])}}" class="btn btn-info btn-sm m-2" ><i class="fas fa-eye"></i></a>

@if($model->status === \App\Models\Job\Vacancy::STATUS_BLOCKED)
    <button type="button" class="btn btn-warning btn-sm m-2" wire:click="unlock({{$model->id}})" title="Разблокировать"><i class="fas fa-unlock-alt"></i> </button>
@endif

@if($model->status === \App\Models\Job\Vacancy::STATUS_ACTIVE || $model->status === \App\Models\Job\Vacancy::STATUS_ANONYMOUS  || $model->status === \App\Models\Job\Vacancy::STATUS_ARCHIVED)
    <button type="button" class="btn btn-danger btn-sm m-2" wire:click="lock({{$model->id}})" title="Заблокировать"><i class="fas fa-lock"></i></button>
@endif

<button type="button" class="btn btn-danger btn-sm m-2" data-bs-toggle="modal" data-bs-target="#deleteModal" wire:click="deleteId({{$model->id}})" title="Удалить"><i class="fas fa-trash"></i></button>
