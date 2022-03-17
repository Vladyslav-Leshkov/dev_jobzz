<?php


namespace App\Models\Job\Traits\Attribute;


trait OfferAttribute
{
    public function getConfirmedAttribute()
    {
        return $this->candidate_status === static::STATUS_CONFIRMED || $this->recruiter_status === static::STATUS_CONFIRMED;
    }

    public function getProfileAttribute()
    {
        return $this->candidate->candidate_profile;
    }
}
