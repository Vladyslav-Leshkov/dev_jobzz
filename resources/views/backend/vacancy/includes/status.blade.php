@switch($value)
    @case(\App\Models\Job\Vacancy::STATUS_INACTIVE)
    <div class="badge bg-secondary">На холде</div>
    @break
    @case(\App\Models\Job\Vacancy::STATUS_ACTIVE)
    <div class="badge bg-success">Активно</div>
    @break
    @case(\App\Models\Job\Vacancy::STATUS_BLOCKED)
    <div class="badge bg-danger">Заблокировано</div>
    @break
    @case(\App\Models\Job\Vacancy::STATUS_ANONYMOUS)
    <div class="badge bg-primary">Анонимная</div>
    @break
    @case(\App\Models\Job\Vacancy::STATUS_ARCHIVED)
    <div class="badge bg-warning">Архивная</div>
    @break
@endswitch
