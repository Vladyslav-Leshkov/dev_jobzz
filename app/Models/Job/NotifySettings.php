<?php

namespace App\Models\Job;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

/**
 * @mixin IdeHelperNotifySettings
 */
class NotifySettings extends Model
{
    use HasFactory;

    protected $fillable = [
        'email_notify',
        'push_notify',
        'telegram_notify',
        'notify_contacts',
        'notify_message',
        'notify_application',
        'notify_candidates',
        'notify_vacancies',
        'notify_news',
    ];

    protected $casts = [
        'email_notify' => 'boolean',
        'push_notify' => 'boolean',
        'telegram_notify' => 'boolean',
        'notify_contacts' => 'boolean',
        'notify_message' => 'boolean',
        'notify_application' => 'boolean',
        'notify_candidates' => 'boolean',
        'notify_vacancies' => 'boolean',
        'notify_news' => 'boolean',
    ];

    /**
     * @return BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
