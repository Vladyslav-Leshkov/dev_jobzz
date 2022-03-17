<?php

namespace App\Models\Job\Traits\Attribute;

use App\Models\Auth\User;
use Carbon\Carbon;

trait CandidateProfileAttribute
{
    public function getUrlAttribute(): string
    {
        return $this->slug ? route('frontend.candidate.show', $this->slug) : '';
    }

    public function getExperienceTitleAttribute()
    {
        if ($this->experience === 0) {
            return __('candidate.experience-title.without');
        }
        if ($this->experience === 1) {
            return __('candidate.experience-title.less-1-year');
        }
        if ($this->experience === 8) {
            return __('candidate.experience-title.7years-p');
        }
        if ($this->experience > 9) {
            return __('candidate.experience-title.10years-p');
        }
        $exp = $this->experience - 1;
        return $exp . ' ' . plural_form($exp, [
                __('candidate.experience-title.one-year'),
                __('candidate.experience-title.two-years'),
                __('candidate.experience-title.many-years')]);
    }

    public function getPriceFullTimeTitleAttribute(): string
    {
        return '₽ ' . number_format($this->price_full_time, 0, '', ' ');
    }

    public function getPriceTitleAttribute(): string
    {
        return $this->is_freelance ? $this->price_freelance_title : $this->price_full_time_title;
    }

    public function getPriceFreelanceTitleAttribute(): string
    {
        return '₽/' . __('candidate.hour') . ' ' . number_format($this->price_freelance, 0, '', ' ');
    }

    public function getIsFreelanceAttribute(): bool
    {
        if ($this->relationLoaded('employment_types')) {
            return $this->employment_types->where('freelance', 1)->count() > 0;
        }

        return $this->employment_types()->where('freelance', 1)->count() > 0;
    }

    public function getIsRemotelyAttribute(): bool
    {
        if ($this->relationLoaded('employment_types')) {
            return $this->employment_types->where('remotely', 1)->count() > 0;
        }

        return $this->employment_types()->where('remotely', 1)->count() > 0;
    }

    public function getPriceAttribute()
    {
        if (site_option('candidate_pay_min', 50000) <= $this->price_full_time) {
            $min_price = site_option('candidate_price_min', 1000);
            $price = ceil($this->price_full_time / site_option('candidate_price_percent', 10));

            return $price < $min_price ? $min_price : $price;
        }
        return 0;
    }

    public function getStatusAttribute()
    {
        $this->loadMissing('user');

        return $this->user ? $this->user->status : User::STATUS_INACTIVE;
    }

    public function setStatusAttribute($value)
    {
        $this->loadMissing('user');
        if ($this->user) {
            $this->user->status = $value;
            $this->user->save();
            $this->save(['timestamps' => false]);
        }

    }
}
