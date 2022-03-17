<?php

namespace App\Models\Job;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;

/**
 * @property int $id
 * @property int|null $user_id
 * @property string|null $invoice_no
 * @property int $status
 * @property int|null $payment_method_id
 * @property string|null $payment_method
 * @property int $amount
 * @property string $currency
 * @property string|null $invoice
 * @property string|null $act
 * @property Carbon|null $paid_at
 * @property string|null $uin
 * @property array $payment_info
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @property-read Collection|Payout[] $payouts
 * @property-read int|null $payouts_count
 * @mixin IdeHelperInvoice
 */
class Invoice extends Model
{
    use HasFactory;

    public const STATUS_NEW = 0;
    public const STATUS_PAYED = 1;
    public const STATUS_REJECTED = 2;
    public const STATUS_EXPIRED = 3;

    protected $fillable = [
        'user_id',
        'invoice_no',
        'status',
        'payment_method_id',
        'payment_method',
        'amount',
        'currency',
        'invoice',
        'act',
        'paid_at',
        'uin',
        'payment_info',
    ];
    protected $dates = [
        'created_at',
        'updated_at',
        'paid_at',
    ];

    protected $casts = [
        'payment_info' => 'array',
        'amount' => 'integer',
    ];

    protected $appends = [
        'status_text',
    ];

    protected static function boot()
    {
        parent::boot();

        self::created(function ($model) {
            //Генерируем уникальный номер
            $model->invoice_no = $model->created_at->format('Y-') . Str::padLeft($model->id, 5, '0');
            $model->save();
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function getStatusTextAttribute()
    {
        switch ($this->status) {
            case self::STATUS_NEW:
                return __('Awaiting Payment');
            case self::STATUS_PAYED:
                return __('Payed');
            case self::STATUS_REJECTED:
                return __('Canceled');
            case self::STATUS_EXPIRED:
                return __('Expired');
        }
        return '';
    }


    public function payouts()
    {
        return $this->hasMany(Payout::class, 'invoice_id')->orderBy('pay_before');
    }
}
