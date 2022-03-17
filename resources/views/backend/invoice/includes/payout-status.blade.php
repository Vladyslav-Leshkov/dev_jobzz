@switch((int)$model->status)
    @case(\App\Models\Job\Payout::STATUS_NEW)
    <div class="badge bg-info">Новый</div>
    @break
    @case(\App\Models\Job\Payout::STATUS_PAID)
    <div class="badge bg-success">Оплачен</div>
    @break
    @case(\App\Models\Job\Payout::STATUS_REJECTED)
    <div class="badge bg-secondary">Отменен</div>
    @break
    @case(\App\Models\Job\Payout::STATUS_PENDING)
    @if($model->is_late)
        <div class="badge bg-danger">Просрочен</div>
    @else
        <div class="badge bg-warning">Ожидание оплаты</div>
    @endif
    @break
@endswitch
