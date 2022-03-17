<a href="{{route('admin.candidate.show', $model)}}" class="btn btn-info btn-sm m-2" title="Информация">
    <i class="fas fa-file-alt"></i>
</a>
@if($model->status === \App\Models\Auth\User::STATUS_MODERATE)
    <button type="button" class="btn btn-success btn-sm m-2" wire:click="unlock({{$model->id}})" title="Подтвердить">
        <i class="fas fa-clipboard-check"></i>
    </button>
@endif
@if($model->status === \App\Models\Auth\User::STATUS_HIDDEN)
    <button type="button" class="btn btn-success btn-sm m-2" wire:click="unlock({{$model->id}})" title="Активировать">
        <i class="fas fa-eye"></i></button>
@endif
@if($model->status === \App\Models\Auth\User::STATUS_ACTIVE)
    <button type="button" class="btn btn-warning btn-sm m-2" wire:click="hide({{$model->id}})" title="Скрыть">
        <i class="fas fa-eye-slash"></i></button>
@endif
@if($model->status === \App\Models\Auth\User::STATUS_BLOCKED)
    <button type="button" class="btn btn-warning btn-sm m-2" wire:click="unlock({{$model->id}})" title="Разблокировать">
        <i class="fas fa-unlock"></i></button>
@endif

@if($model->status === \App\Models\Auth\User::STATUS_ACTIVE || $model->status === \App\Models\Auth\User::STATUS_HIDDEN)
    <button type="button" class="btn btn-warning btn-sm m-2" wire:click="lock({{$model->id}})" title="Заблокировать"><i
                class="fas fa-lock"></i></button>
@endif


<button type="button" class="btn btn-danger btn-sm m-2" data-bs-toggle="modal" data-bs-target="#deleteModal"
        wire:click="deleteId({{$model->id}})" title="Удалить"><i class="fas fa-trash"></i></button>
