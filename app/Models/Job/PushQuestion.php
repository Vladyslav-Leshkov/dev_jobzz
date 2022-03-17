<?php

namespace App\Models\Job;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

/**
 * @property User $user
 * @property User $recruiter
 * @property Vacancy $vacancy
 * @mixin IdeHelperPushQuestion
 */
class PushQuestion extends Model
{
    use HasFactory;

    public const ANSWER_YES = 'yes'; // да
    public const ANSWER_NO = 'no'; // нет
    public const ANSWER_STILL = 'still'; // еще общаемся

    public const TYPE_VACANCY_CANDIDATE = 'vacancy-candidate'; // кандидат при закрытии вакансии рекрутером
    public const TYPE_VACANCY_RECRUITER = 'vacancy-recruiter'; // рекрутер при закрытии вакансии по истечении 30 дней
    public const TYPE_ACQUAINTANCE = 'acquaintance'; // каждые три дня о знакомстве

    protected $fillable = [
        'user_id',
        'vacancy_id',
        'recruiter_id',
        'question',
        'answer',
        'type',
        'starts_at',
        'ends_at',
    ];


    protected $dates = [
        'created_at',
        'updated_at',
        'starts_at',
        'ends_at',
    ];


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function vacancy()
    {
        return $this->belongsTo(Vacancy::class, 'vacancy_id');
    }

    public function recruiter()
    {
        return $this->belongsTo(User::class, 'recruiter_id');
    }

    public function scopeOnlyNew(Builder $query)
    {
        return $query->whereNull('answer')
            ->where(function ($q) {
                $q->whereDate('starts_at', '<=', Carbon::now())->orWhereNull('starts_at');
            })
            ->where(function ($q) {
                $q->whereDate('ends_at', '>=', Carbon::now())->orWhereNull('ends_at');
            });
    }
}
