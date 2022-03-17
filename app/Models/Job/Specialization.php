<?php

namespace App\Models\Job;

use App\Models\Traits\HasLocalizedTitle;
use App\Models\Traits\HasLogo;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

/**
 * Class Specialization
 *
 * @package App\Models\Job
 * @mixin IdeHelperSpecialization
 */
class Specialization extends Model
{
    use HasLocalizedTitle;
    use Sluggable;
    use HasLogo;

    protected $fillable = [
        'type_id',
        'title_en',
        'title_ru',
        'slug',
        'popular',
        'image',
    ];

    protected $appends = [
        'title',
        'url',
        'logo_url',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
        'logo',
    ];

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title_en',
            ],
        ];
    }

    public function type()
    {
        return $this->belongsTo(SpecializationType::class, 'type_id');
    }

    public function vacancies()
    {
        return $this->belongsToMany(Vacancy::class, 'vacancy_specializations');
    }

    /**
     * @return BelongsToMany
     */
    public function skills()
    {
        return $this->belongsToMany(Skill::class, 'specializations_skills');
    }

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function getUrlAttribute()
    {
        return !empty($this->slug) && $this->type !== null
            ? route('frontend.vacancy.specialization', $this->slug)
            : '';
    }

    protected $with = [
        'type',
    ];
}
