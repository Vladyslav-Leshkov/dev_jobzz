<a href="{{route('admin.invoice.show', $model)}}" class="btn btn-info btn-sm m-2" title="Просмотр">
    <i class="fas fa-file-alt"></i>
</a>
@if($model->invoice)
    <a href="{{route('admin.invoice.download', $model)}}" target="_blank" class="btn btn-outline-success btn-sm m-2">
        <i class="fas fa-file-download"></i> Счет
    </a>
@endif
@if($model->status === \App\Models\Job\Payout::STATUS_PAID)
    @if(!empty($model->act) && !(isset($act_file) && $current_id === $model->id))
        <a href="{{route('admin.invoice.download-act', $model)}}" target="_blank" class="btn btn-secondary btn-sm m-2">
            <i class="fas fa-file-download"></i> Скачать Акт
        </a>
        <a href="#" wire:click.prevent="clearAct({{$model->id}})" class="btn btn-warning btn-sm m-2">
            <i class="fas fa-times"></i> Удалить Акт
        </a>
    @endif

    @if(empty($model->act))
        <form wire:submit.prevent="uploadAct()" style="display: inline-block">
            <label class="btn btn-outline-warning btn-sm m-2">
                <i class="fas fa-file-upload"></i> {{$act_file ? 'Акт выбран' : 'Загрузить Акт'}}
                <input style="display: none" type="file" name="act" wire:model="act_file"
                       wire:change="currentId({{$model->id}})">
            </label>
            @if(isset($act_file) && $current_id === $model->id)
                <button type="submit" class="btn btn-secondary btn-sm m-2">Загрузить</button>
                <button type="reset" class="btn btn-secondary btn-sm m-2" wire:click.prevent="currentId(0)">Отмена
                </button>
            @endif
        </form>
    @endif
@endif
@if($model->status === \App\Models\Job\Payout::STATUS_NEW || $model->status === \App\Models\Job\Payout::STATUS_PENDING)
    <br>
    <button type="button" class="btn btn-success btn-sm m-2"
            wire:click="mark({{$model->id}}, {{\App\Models\Job\Payout::STATUS_PAID}})"><i
                class="fas fa-clipboard-check"></i> Оплачен
    </button>
    <button type="button" class="btn btn-danger btn-sm m-2"
            wire:click="mark({{$model->id}}, {{\App\Models\Job\Payout::STATUS_REJECTED}})"><i
                class="fas fa-ban"></i> Отменить
    </button>
@endif
