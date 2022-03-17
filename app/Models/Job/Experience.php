<?php

namespace App\Models\Job;

use App\Models\Traits\HasLocalizedTitle;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Experience
 *
 * @package App\Models\Job
 * @mixin IdeHelperExperience
 */
class Experience extends Model
{
    use HasLocalizedTitle;
    use Sluggable;

    protected $fillable = [
        'title_en',
        'title_ru',
        'slug',
    ];

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title_en'
            ]
        ];
    }
}
