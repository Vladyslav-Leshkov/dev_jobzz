<?php

namespace App\Models\Job\Traits\Attribute;

trait VacancyAttribute
{
    public function getUrlAttribute(): ?string
    {
        return !empty($this->slug) ? route('frontend.vacancy.show', $this->slug) : null;
    }

    public function getRecruiterUrlAttribute(): ?string
    {
        return $this->user ? route('frontend.recruiter.show', $this->user->id) : null;
    }

    public function getExperienceTitleAttribute(): string
    {
        if ($this->experience === 0) {
            return 'Без опыта';
        }
        if ($this->experience === 1) {
            return 'Менее 1 года';
        }

        $exp = $this->experience - 1;
        return 'От ' . $exp . ' ' . plural_form($exp, ['года', 'лет', 'лет']);
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

    public function getPositionAttribute()
    {
        return $this->user ? $this->user->position : '';
    }


    public function getTotalHiresAttribute()
    {
        return $this->user ? $this->user->hires : 0;
    }
}
