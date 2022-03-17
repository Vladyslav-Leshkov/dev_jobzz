<?php

namespace App\Models\Job;

use App\Models\Traits\HasLocalizedTitle;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperPaymentMethod
 */
class PaymentMethod extends Model
{
    use HasLocalizedTitle;

    public const METHOD_INVOICE = 'invoice';
    public const METHOD_SWIFT = 'swift';
    public const METHOD_CARD = 'card';

    protected $fillable = [
        'title_ru',
        'title_en',
        'slug',
        'description',
        'active',
    ];

    protected $appends = [
        'title',
    ];
}
