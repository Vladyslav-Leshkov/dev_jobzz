@switch($value)
    @case(\App\Models\Auth\User::STATUS_ACTIVE)
    <div class="badge bg-success">Активный</div>
    @break
    @case(\App\Models\Auth\User::STATUS_INACTIVE)
    <div class="badge bg-secondary">Не активный</div>
    @break
    @case(\App\Models\Auth\User::STATUS_BLOCKED)
    <div class="badge bg-danger">Заблочен</div>
    @break
    @case(\App\Models\Auth\User::STATUS_MODERATE)
    <div class="badge bg-warning">На модерации</div>
    @break
    @case(\App\Models\Auth\User::STATUS_HIDDEN)
    <div class="badge bg-primary">Скрытый</div>
    @break
@endswitch
