@switch((int)$value)
    @case(\App\Models\Job\Invoice::STATUS_NEW)
    <div class="badge bg-info">Новый</div>
    @break
    @case(\App\Models\Job\Invoice::STATUS_PAYED)
    <div class="badge bg-success">Оплачен</div>
    @break
    @case(\App\Models\Job\Invoice::STATUS_REJECTED)
    <div class="badge bg-danger">Отменен</div>
    @break
    @case(\App\Models\Job\Invoice::STATUS_EXPIRED)
    <div class="badge bg-warning">Просрочен</div>
    @break
@endswitch
