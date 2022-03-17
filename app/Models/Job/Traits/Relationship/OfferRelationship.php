<?php


namespace App\Models\Job\Traits\Relationship;


use App\Models\Auth\User;
use App\Models\Job\CandidateProfile;
use App\Models\Job\Vacancy;

trait OfferRelationship
{
    public function vacancy()
    {
        return $this->belongsTo(Vacancy::class, 'vacancy_id')->withTrashed();
    }

    public function candidate()
    {
        return $this->belongsTo(User::class, 'candidate_id')->withTrashed();
    }

    public function recruiter()
    {
        return $this->belongsTo(User::class, 'recruiter_id')->withTrashed();
    }
}
