<?php

namespace App\Models\Job\Traits\Relationship;

use App\Models\Auth\User;
use App\Models\Job\EmploymentType;
use App\Models\Job\Offer;
use App\Models\Job\Skill;
use App\Models\Job\Specialization;
use App\Models\Location\City;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

trait CandidateRelationship
{
    public function cities()
    {
        return $this->belongsToMany(City::class, 'candidate_cities', 'profile_id');
    }

    public function employment_types()
    {
        return $this->belongsToMany(EmploymentType::class, 'candidate_employment_types', 'profile_id');
    }

    public function specializations()
    {
        return $this->belongsToMany(Specialization::class, 'candidate_specializations', 'profile_id');
    }

    /**
     * Основные скилы кандидата
     * @return BelongsToMany
     */
    public function skills()
    {
        return $this->all_skills()->where('main', 1)->orderByPivot('position');
    }

    /**
     * Все скилы кандидата
     * @return BelongsToMany
     */
    public function all_skills()
    {
        return $this->belongsToMany(Skill::class, 'candidate_skills', 'profile_id');
    }

    /**
     * Дополнительные скилы кандидата
     * @return BelongsToMany
     */
    public function additional_skills()
    {
        return $this->all_skills()->where('main', 0)->orderByPivot('position');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function offers()
    {
        return $this->hasMany(Offer::class, 'candidate_id', 'user_id');
    }

    /**
     *
     */
    public function visitors()
    {
        return $this->morphToMany(User::class, 'model', 'visitables');
    }
}
