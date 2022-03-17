<?php

namespace App\Models\Job;

use App\Models\Traits\HasLocalizedTitle;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasManyThrough;

/**
 * Class SpecializationType
 *
 * @package App\Models\Job
 * @mixin IdeHelperSpecializationType
 */
class SpecializationType extends Model
{
    use HasLocalizedTitle;
    use Sluggable;

    protected $fillable = [
       'title_en',
       'title_ru',
       'slug',
       'popular',
    ];

    protected $appends = [
        'title',
        'url',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title_en',
            ],
        ];
    }

    public function items(): HasMany
    {
        return $this->hasMany(Specialization::class, 'type_id');
    }


    public function vacancies(): HasManyThrough
    {
        return $this->hasManyThrough(Vacancy::class, Specialization::class);
    }


    public function scopePopular(Builder $query)
    {
        return $query->where('popular', 1);
    }


    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function getUrlAttribute()
    {
        return !empty($this->slug) ? route('frontend.category.type', $this->slug) : '';
    }
}
