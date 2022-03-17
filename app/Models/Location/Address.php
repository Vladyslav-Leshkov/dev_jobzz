<?php

namespace App\Models\Location;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphTo;

/**
 * @mixin IdeHelperAddress
 */
class Address extends Model
{
    protected $fillable = [
        'postcode',
        'country_id',
        'country',
        'region_id',
        'region',
        'city_id',
        'city',
        'street_address1',
        'street_address2',
        'lat',
        'lng',
        'first_name',
        'last_name',
        'name',
        'phone',
        'email',
        'inn',
        'eu_vat_id',
    ];

    protected $casts = [
        'country_id' => 'integer',
        'region_id' => 'integer',
        'city_id' => 'integer',
        'lat' => 'float',
        'lng' => 'float',
    ];

    /** @var array */
    protected $guarded = ['id', 'created_at', 'updated_at'];

    protected $hidden = [
        'model_type',
        'model_id',
        'id',
        'created_at',
        'updated_at',
    ];

    protected $appends = [
        'name',
    ];

    /**
     * @return MorphTo
     */
    public function model(): MorphTo
    {
        return $this->morphTo();
    }

    /**
     * Change the role of the current address model.
     *
     * @param string $role
     *
     * @return bool
     */
    public function role(string $role): bool
    {
        return $this->update(compact('role'));
    }

    public function getNameAttribute()
    {
        return trim($this->first_name . ' ' . $this->last_name);
    }

    public function setNameAttribute($value = '')
    {
        $fio = array_filter(explode(' ', $value));
        if (count($fio) > 1) {
            $this->last_name = $fio[1];
        }
        if (count($fio) > 0) {
            $this->first_name = $fio[0];
        }
    }
}
