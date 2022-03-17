<?php

namespace App\Models\Job\Traits\Attribute;

trait CompanyAttribute
{
    public function getUrlAttribute(): ?string
    {
        return !empty($this->slug) ? route('frontend.company.show', $this->slug) : null;
    }

    public function getPositionAttribute()
    {
        return  $this->pivot ? $this->pivot->user->position : '';
    }
}
