<?php

namespace App\Models\Location;

use App\Models\Traits\HasLocalizedTitle;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

/**
 * @mixin IdeHelperRegion
 */
class Region extends Model
{
    use HasLocalizedTitle;
    use Sluggable;

    protected $fillable = [
        'title_ru',
        'title_en',
        'slug',
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

    public function cities(): HasMany
    {
        return $this->hasMany(City::class);
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title_en'
            ]
        ];
    }
}
