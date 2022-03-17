<?php


namespace App\Models\Job\Traits\Scope;


use App\Models\Job\Offer;
use Illuminate\Database\Eloquent\Builder;

trait OfferScope
{
    public function scopeConfirmed(Builder $query): Builder
    {
        return $query->where(function (Builder $q) {
            $q->where('candidate_status', Offer::STATUS_CONFIRMED)
                ->orWhere('recruiter_status', Offer::STATUS_CONFIRMED);
        });
    }


}
