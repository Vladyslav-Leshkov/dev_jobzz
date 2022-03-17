<?php

namespace App\Models\Location;

use App\Models\Traits\HasLocalizedTitle;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\HigherOrderCollectionProxy;

/**
 * Class Country
 *
 * @package App\Models\Location
 * @mixin IdeHelperCountry
 */
class Country extends Model
{
    use HasLocalizedTitle;
    use Sluggable;

    protected $fillable = [
        'title_ru',
        'title_en',
        'code',
        'slug',
    ];

    protected $appends = [
        'title',
    ];

    protected $hidden = [
        'created_at',
        'updated_at',
    ];

    /**
     * @param $id
     *
     * @return HigherOrderCollectionProxy|mixed|string
     */
    public static function getNameById($id, $locale = null)
    {
        $country = self::find($id);
        if ($locale !== null) {
            return $country ? $country->{'title_' . $locale} : '';
        }

        return $country ? $country->title : '';
    }

    public function regions(): HasMany
    {
        return $this->hasMany(Region::class);
    }

    public function cities(): HasMany
    {
        return $this->hasMany(City::class);
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title_en',
            ],
        ];
    }
}
