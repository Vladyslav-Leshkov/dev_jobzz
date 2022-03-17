<?php

namespace App\Services\Frontend\Job;

use App\Models\Job\Currency;
use App\Models\Job\EmploymentType;
use App\Models\Job\EnglishLevel;
use App\Models\Job\Experience;
use App\Models\Job\Salary;
use App\Models\Job\Skill;
use App\Models\Job\SpecializationType;
use App\Models\Location\City;
use App\Services\BaseService;

class ProfileService extends BaseService
{
    public static function getProfileOptions(): array
    {
        return [
            'employment_types' => EmploymentType::query()->get(),
            'cities' => City::query()->where('used', 1)->get(),
            'specializations' => SpecializationType::query()->with(['items', 'items.skills'])->get(),
            'experiences' => Experience::query()->get(),
            'english_levels' => EnglishLevel::query()->get(),
            'english_titles' => EnglishLevel::titles(),
            'currencies' => Currency::query()->get(),
            'salaries' => Salary::query()->get(),
            'skills' => Skill::query()->where('is_custom', 0)->get(),
        ];
    }
}
