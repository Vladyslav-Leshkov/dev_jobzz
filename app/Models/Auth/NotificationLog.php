<?php

namespace App\Models\Auth;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphTo;

/**
 * @mixin IdeHelperNotificationLog
 */
class NotificationLog extends Model
{
    use HasFactory;

    public const TYPE_CHAT_MESSAGE_MAIL = 'chat-message-mail'; // Уведомления о новых сообщениях
    public const TYPE_CHAT_MESSAGE_TELEGRAM = 'chat-message-telegram'; // Уведомления о новых сообщениях

    protected $fillable = [
        'type',
        'notifiable_id',
        'notifiable_type',
        'data',
    ];

    protected $casts = [
        'data' => 'array',
    ];

    protected $dates = [
        'created_at',
        'updated_at',
    ];

    /**
     * @return MorphTo
     */
    public function model(): MorphTo
    {
        return $this->morphTo('notifiable');
    }
}
