<?php

namespace App\Models\Job;

use App\Models\Traits\HasLocalizedDescription;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Model;

/**
 * Class EnglishLevel
 *
 * @package App\Models\Job
 * @mixin IdeHelperEnglishLevel
 */
class EnglishLevel extends Model
{
    use HasLocalizedDescription;
    use Sluggable;

    public static function titles()
    {
        return [
            0 => __("Does not matter"),
            1 => "Beginner",
            2 => "Pre-Intermediate",
            3 => "Intermediate",
            4 => "Upper-Intermediate",
            5 => "Advanced",
            6 => "Fluent",
        ];
    }


    protected $fillable = [
        'title',
        'description_en',
        'description_ru',
        'slug',
    ];

    protected $appends = [
        'description'
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }
}
