@if($model->status === \App\Models\Job\Payout::STATUS_NEW || $model->status === \App\Models\Job\Payout::STATUS_PENDING)
    <button class="btn btn-outline-info text-nowrap m-2" wire:click="extendPayBefore({{$model->id}})">
        Продлить срок оплаты на 3 дня
    </button>
@endif
