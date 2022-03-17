<?php

namespace App\Models\Job\Traits\Relationship;

use App\Models\Auth\User;
use App\Models\Job\CompanyUser;
use App\Models\Job\Vacancy;
use App\Models\Location\Address;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\MorphMany;
use Illuminate\Database\Eloquent\Relations\MorphToMany;

trait CompanyRelationship
{

    /**
     * @return BelongsToMany
     */
    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'company_users')->using(CompanyUser::class);
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
    public function vacancies(): HasMany
    {
        return $this->hasMany(Vacancy::class);
    }
}
