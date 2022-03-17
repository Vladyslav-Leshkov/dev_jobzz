<?php

namespace App\Models\Auth\Traits\Relationship;

use App\Models\Auth\NotificationLog;
use App\Models\Auth\PasswordHistory;
use App\Models\Job\CandidateOpenData;
use App\Models\Job\CandidateProfile;
use App\Models\Job\Company;
use App\Models\Job\CompanyUser;
use App\Models\Job\NotifySettings;
use App\Models\Job\Offer;
use App\Models\Job\Payout;
use App\Models\Job\PushQuestion;
use App\Models\Job\Vacancy;
use App\Models\Job\Visitable;
use App\Models\Location\Address;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Illuminate\Database\Eloquent\Relations\MorphMany;

/**
 * Class UserRelationship.
 */
trait UserRelationship
{
    /**
     * @return mixed
     */
    public function passwordHistories()
    {
        return $this->morphMany(PasswordHistory::class, 'model');
    }

    /**
     * @return HasMany
     */
    public function vacancies()
    {
        return $this->hasMany(Vacancy::class);
    }

    /**
     * @return Company
     */
    public function getCompanyAttribute()
    {
        return $this->companies()->first();
    }

    /**
     * @return BelongsToMany
     */
    public function companies()
    {
        return $this->belongsToMany(Company::class, 'company_users')->using(CompanyUser::class)
            ->withPivot(['is_admin', 'status']);
    }

    /**
     * @return HasOne
     */
    public function candidate_profile()
    {
        return $this->hasOne(CandidateProfile::class)->withTrashed()->withDefault([
            'user_id' => $this->id,
            'status' => $this->status,
        ]);
    }


    /**
     * @return HasMany
     */
    public function payed_payouts()
    {
        return $this->payouts()->where('status', Payout::STATUS_PAID);
    }

    /**
     * @return HasMany
     */
    public function payouts()
    {
        return $this->hasMany(Payout::class, 'recruiter_id');
    }

    /**
     * @return HasMany
     */
    public function new_payouts()
    {
        return $this->payouts()->where('status', Payout::STATUS_NEW);
    }

    /**
     * @return HasMany
     */
    public function to_pay_payouts()
    {
        return $this->payouts()->whereIn('status', [Payout::STATUS_NEW, Payout::STATUS_PENDING]);
    }

    /**
     *
     * @return HasMany
     */
    public function danger_payouts()
    {
        return $this->payouts()->toDanger();
    }

    /**
     * Просроченные выплаты
     *
     * @return HasMany
     */
    public function late_payouts()
    {
        return $this->payouts()->toBlock();
    }

    /**
     * @return MorphMany
     */
    public function addresses(): MorphMany
    {
        return $this->morphMany(Address::class, 'model');
    }

    /**
     * @return HasMany
     */
    public function openDatas()
    {
        return $this->hasMany(CandidateOpenData::class, 'candidate_id');
    }

    /**
     * @return HasOne
     */
    public function notifySettings()
    {
        return $this->hasOne(NotifySettings::class, 'user_id')->withDefault([
            'user_id' => $this->id,
            'push_notify' => 1,
            'telegram_notify' => 0,
            'email_notify' => 1,
            'notify_contacts' => 1,
            'notify_message' => 1,
            'notify_application' => 1,
            'notify_candidates' => 1,
            'notify_vacancies' => 1,
            'notify_news' => 1,
        ]);
    }

    /**
     * PUSH Вопросы
     *
     * @return HasMany
     */
    public function pushQuestions()
    {
        return $this->hasMany(PushQuestion::class, 'user_id');
    }

    /**
     * Предложения и отклики кандидата
     *
     * @return HasMany
     */
    public function cnadidateOffers()
    {
        return $this->hasMany(Offer::class, 'candidate_id');
    }

    /**
     * Предложения и отклики рекрутера
     *
     * @return HasMany
     */
    public function recruiterOffers()
    {
        return $this->hasMany(Offer::class, 'recruiter_id');
    }

    /**
     * @return MorphMany
     */
    public function notificationLogs(): MorphMany
    {
        return $this->morphMany(NotificationLog::class, 'notifiable');
    }

    /**
     * @return MorphMany
     */
    public function visitables()
    {
        return $this->hasMany(Visitable::class, 'user_id');
    }


    public function visitedVacancies()
    {
        return $this->morphedByMany(Vacancy::class, 'model', 'visitables');

    }


    public function visitedCandidates()
    {
        return $this->morphedByMany(CandidateProfile::class, 'model', 'visitables');
    }
}
