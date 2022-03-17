<?php

namespace App\Models\Job;

use App\Models\Job\Traits\HasLocationTitle;
use App\Models\Traits\HasLocalizedDescription;
use App\Models\Traits\HasLogo;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperPartner
 */
class Partner extends Model
{
    use HasFactory;
    use Sluggable;
    use HasLogo;
    use HasLocationTitle;
    use HasLocalizedDescription;

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => ['title_en'],
            ],
        ];
    }


    protected $fillable = [
        'title_ru',
        'title_en',
        'description_ru',
        'description_en',
        'slug',
        'logo',
    ];
}
