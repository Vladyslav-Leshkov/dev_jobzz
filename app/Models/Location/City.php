<?php

namespace App\Models\Location;

use App\Models\Traits\HasLocalizedTitle;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * Class City
 *
 * @package App\Models\Location
 * @mixin IdeHelperCity
 */
class City extends Model
{
    use HasLocalizedTitle;
    use Sluggable;

    protected $fillable = [
        'title_ru',
        'title_en',
        'country_id',
        'region_id',
        'slug',
        'used',
        'popular',
    ];

    protected $appends = [
        'title'
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    public function country(): BelongsTo
    {
        return $this->belongsTo(Country::class);
    }

    public function region(): BelongsTo
    {
        return $this->belongsTo(Region::class);
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title_en'
            ]
        ];
    }

    public function title()
    {
        return $this->getTitleAttribute();
    }
}
