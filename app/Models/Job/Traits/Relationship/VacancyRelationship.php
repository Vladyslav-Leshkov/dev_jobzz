<?php

namespace App\Models\Job\Traits\Relationship;

use App\Models\Auth\User;
use App\Models\Job\Offer;
use App\Models\Job\Company;
use App\Models\Job\EmploymentType;
use App\Models\Job\Skill;
use App\Models\Job\Specialization;
use App\Models\Location\City;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\HasManyThrough;

trait VacancyRelationship
{
    /**
     * Пользователь
     *
     * @return BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id')->withTrashed();
    }

    /**
     * Компания
     *
     * @return BelongsTo
     */
    public function company()
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    /**
     * @return BelongsToMany
     */
    public function cities()
    {
        return $this->belongsToMany(City::class, 'vacancy_cities');
    }

    /**
     * @return BelongsToMany
     */
    public function employment_types()
    {
        return $this->belongsToMany(EmploymentType::class, 'vacancy_employment_types');
    }

    /**
     * @return BelongsToMany
     */
    public function specializations()
    {
        return $this->belongsToMany(Specialization::class, 'vacancy_specializations');
    }

    /**
     * Отклики на вакансию
     *
     * @return HasMany|Builder
     */
    public function job_applications()
    {
        return $this->offers()->where('initiator', Offer::INITIATOR_CANDIDATE);
    }

    /**
     * Все предложения
     *
     * @return HasMany|Builder
     */
    public function offers()
    {
        return $this->hasMany(Offer::class, 'vacancy_id');
    }

    /**
     * Предложения вакансий
     *
     * @return HasMany|Builder
     */
    public function job_offers()
    {
        return $this->offers()->where('initiator', Offer::INITIATOR_RECRUITER);
    }

    /**
     * Все кандидаты
     *
     * @return HasManyThrough|Builder
     */
    public function candidates()
    {
        return $this->hasManyThrough(User::class, Offer::class, 'vacancy_id', 'id', 'id', 'candidate_id');
    }

    /**
     * Навыки
     *
     * @return BelongsToMany|Builder
     */
    public function skills()
    {
        return $this->belongsToMany(Skill::class, 'vacancy_skills');
    }

    /**
     *
     */
    public function visitors()
    {
        return $this->morphToMany(User::class, 'model', 'visitables');
    }

}
