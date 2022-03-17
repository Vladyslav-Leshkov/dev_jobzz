<?php

namespace App\Models\Job\Traits;

use App\Models\Job\EnglishLevel;

trait HasEnglishTitle
{
    public function getEnglishTitleAttribute()
    {
        return EnglishLevel::titles()[$this->english_level] ?? '';
    }
}
