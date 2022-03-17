<?php

namespace App\Models\Messenger;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

/**
 * @property int $id
 * @property int $from_id
 * @property int $to_id
 * @property string $body
 * @property Carbon $created_at
 */
class ChatMessage extends Model
{
    protected $fillable = [
        'type',
        'from_id',
        'to_id',
        'body',
        'attachment',
        'seen',
        'edited',
    ];

    protected $dates = [
        'created_at',
    ];

    protected $appends = [
        'short',
        'date',
        'time',
    ];

    protected $casts = [
        'attachment' => 'array',
        'seen' => 'bool',
        'edited' => 'bool',
    ];

    public function fromUser()
    {
        return $this->belongsTo(User::class, 'from_id')->select([
            'id',
            'type',
            'avatar',
            'first_name',
            'last_name',
            'last_activity',
        ]);
    }

    public function toUser()
    {
        return $this->belongsTo(User::class, 'to_id')->select([
            'id',
            'type',
            'avatar',
            'first_name',
            'last_name',
            'last_activity',
        ]);
    }

    public function getShortAttribute()
    {
        return str_limit(strip_tags($this->body));
    }

    public function getTimeAttribute()
    {
        //TODO: Проверить корректность отображения времени
        return $this->created_at->format('H:i');
    }

    public function getDateAttribute()
    {
        return $this->created_at->format('d.m.Y');
    }
}
