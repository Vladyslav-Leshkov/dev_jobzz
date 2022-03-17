<?php

namespace App\Models\Job;

use App\Models\Traits\HasLocalizedDescription;
use App\Models\Traits\HasLocalizedTitle;
use App\Models\Traits\UseFormOptions;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Model;

/**
 * Class EmploymentType
 *
 * @package App\Models\Job
 * @mixin IdeHelperEmploymentType
 */
class EmploymentType extends Model
{
    use HasLocalizedTitle;
    use HasLocalizedDescription;
    use UseFormOptions;
    use Sluggable;

    protected $fillable = [
        'title_en',
        'title_ru',
        'description_en',
        'description_ru',
        'freelance',
        'remotely',
        'slug',
    ];

    protected $casts = [
        'freelance'=>'boolean',
        'remotely'=>'boolean',
    ];

    protected $appends = [
        'title',
        'description',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
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
