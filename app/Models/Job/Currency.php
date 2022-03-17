<?php

namespace App\Models\Job;

use App\Models\Traits\HasLocalizedDescription;
use App\Models\Traits\HasLocalizedTitle;
use Cviebrock\EloquentSluggable\Sluggable;
use http\Exception\InvalidArgumentException;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Currency
 *
 * @package App\Models\Job
 * @mixin IdeHelperCurrency
 */
class Currency extends Model
{
    use HasLocalizedTitle;
    use HasLocalizedDescription;
    use Sluggable;

    public const BASE_CURRENCY = 'RUB';

    protected $fillable = [
        'title_en',
        'title_ru',
        'description_en',
        'description_ru',
        'symbol',
        'iso',
        'course',
        'slug',
    ];

    protected $casts = [
        'course' => 'float',
    ];

    public static function convertAmount($amount, $to_currency, $from_currency = self::BASE_CURRENCY)
    {
        if ($from_currency === $to_currency) {
            return $amount;
        }

        if ($from_currency !== self::BASE_CURRENCY) {
            // конвертируем в базовый курс
            $from_curr = Currency::whereIso(strtoupper($from_currency))->first();
            $amount = ceil((float)$amount / (float)$from_curr->course);
        }

        $currency = Currency::whereIso(strtoupper($to_currency))->first();
        if ($currency) {
            return ceil((float)$amount * (float)$currency->course);
        }

        throw new InvalidArgumentException("Currency {$to_currency} not found");
    }

    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'iso',
            ],
        ];
    }
}
