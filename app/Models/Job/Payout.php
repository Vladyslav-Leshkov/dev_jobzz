<?php

namespace App\Models\Job;

use App\Events\PayoutCreated;
use App\Models\Auth\User;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

/**
 * @mixin IdeHelperPayout
 */
class Payout extends Model
{
    use SoftDeletes;

    public const STATUS_NEW = 0;
    public const STATUS_PAID = 1;
    public const STATUS_REJECTED = 2;
    public const STATUS_PENDING = 3;
    public const STATUS_EXPIRED = 4;

    protected $fillable = [
        'vacancy_id',
        'candidate_id',
        'recruiter_id',
        'status',
        'released_to_work',
        'pay_before',
        'amount',
        'currency',
        'user_warn_sent',
        'admin_warn_sent',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
        'deleted_at',
        'paid_at',
        'released_to_work',
        'pay_before',
    ];

    protected $appends = [
        'candidate_info',
    ];

    protected $hidden = [
        'candidate',
    ];

    protected $casts = [
        'user_warn_sent' => 'boolean',
        'admin_warn_sent' => 'boolean',
    ];

    protected static function boot()
    {
        parent::boot();

        self::created(function ($model) {
            PayoutCreated::dispatch($model);
        });
    }

    public function candidate()
    {
        return $this->belongsTo(User::class, 'candidate_id');
    }

    public function vacancy()
    {
        return $this->belongsTo(Vacancy::class, 'vacancy_id');
    }

    public function recruiter()
    {
        return $this->belongsTo(User::class, 'recruiter_id');
    }

    public function invoice()
    {
        return $this->belongsTo(Invoice::class, 'invoice_id');
    }

    public function getInvoiceNoAttribute()
    {
        return $this->invoice ? $this->invoice->invoice_no : $this->created_at->format('Y-') . Str::padLeft($this->id, 5, '0');
    }

    public function getRecruiterInfoAttribute(): array
    {
        if (!$this->relationLoaded('recruiter')) {
            $this->load(['recruiter' => function ($q) {
                $q->withTrashed();
            }]);
        }
        if ($this->recruiter) {
            return $this->recruiter->shortInfo(['email', 'company']);
        }
        return [
            'id' => 0,
            'first_name' => 'User',
            'last_name' => 'Deleted',
            'type' => 'recruiter',
            'name' => 'User Deleted',
            'avatar_url' => '/images/no-avatar.svg',
            'position' => '',
            'email' => '',
            'last_activity' => null,
            'last_activity_title' => 'n/a',
            'timezone' => '',
            'is_online' => false,
            'company' => null,
        ];
    }

    public function getCandidateInfoAttribute(): array
    {
        if (!$this->relationLoaded('candidate')) {
            $this->load(['candidate' => function ($q) {
                $q->withTrashed();
            }]);
        }
        if ($this->candidate) {
            return $this->candidate->shortInfo(['email']);
        }
        return [
            'id' => 0,
            'first_name' => 'User',
            'last_name' => 'Deleted',
            'type' => 'candidate',
            'name' => 'User Deleted',
            'avatar_url' => '/images/no-avatar.svg',
            'position' => '',
            'email' => '',
            'last_activity' => null,
            'last_activity_title' => 'n/a',
            'timezone' => '',
            'is_online' => false,
        ];
    }


    public function getIsLateAttribute()
    {
        return $this->pay_before->lte(Carbon::now()->endOfDay());
    }

    public function scopePayed(Builder $query)
    {
        return $query->where('status', self::STATUS_PAID);
    }

    public function scopeNew(Builder $query)
    {
        return $query->where('status', self::STATUS_NEW);
    }

    public function scopeRejected(Builder $query)
    {
        return $query->where('status', self::STATUS_REJECTED);
    }

    /**
     * Для предупреждения пользователя
     *
     * @param Builder $query
     * @param int $days
     *
     * @return Builder
     */
    public function scopeToWarn(Builder $query, int $days = 3)
    {
        return $query->whereIn('status', [Payout::STATUS_NEW, Payout::STATUS_PENDING])
            ->where('user_warn_sent', 0)
            ->whereDate('pay_before', '<=', Carbon::now()->addDays($days)->endOfDay());
    }

    /**
     * Для предупреждения админа
     *
     * @param Builder $query
     * @param int $days
     *
     * @return Builder
     */
    public function scopeToDanger(Builder $query, int $days = 1)
    {
        return $query->whereIn('status', [Payout::STATUS_NEW, Payout::STATUS_PENDING])
            ->where('user_warn_sent', 1)
            ->whereDate('pay_before', '<=', Carbon::now()->addDays($days)->endOfDay());
    }

    /**
     * Для блокировки
     *
     * @param Builder $query
     * @param int $days
     *
     * @return Builder
     */
    public function scopeToBlock(Builder $query, int $days = 1)
    {
        return $query->whereIn('status', [Payout::STATUS_NEW, Payout::STATUS_PENDING])
            ->where('user_warn_sent', 1)
            ->whereDate('pay_before', '<=', Carbon::now()->subDays($days)->endOfDay());
    }
}
