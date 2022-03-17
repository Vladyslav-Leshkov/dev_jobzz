@switch($model->status)
    @case(\App\Models\Job\Payout::STATUS_NEW)
    <div class="badge bg-info">Ожидает оплаты</div>
    @break
    @case(\App\Models\Job\Payout::STATUS_PENDING)
    <div class="badge {{$model->is_late ? 'bg-danger' : 'bg-success'}}">Ожидает оплаты</div>
    @break
    @case(\App\Models\Job\Payout::STATUS_PAID)
    <div class="badge bg-success">Оплачено</div>
    @break
    @case(\App\Models\Job\Payout::STATUS_REJECTED)
    <div class="badge bg-warning">Отменено</div>
    @break
@endswitch
