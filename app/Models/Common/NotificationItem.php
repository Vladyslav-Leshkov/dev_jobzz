<?php

namespace App\Models\Common;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin IdeHelperNotificationItem
 */
class NotificationItem extends Model
{
    protected $fillable = [
        'type',
        'user_id',
        'role',
        'icon',
        'url',
        'title',
        'message',
        'viewed',
    ];

    protected $appends = [
        'time',
    ];

    protected $dates = [
        'created_at',
    ];

    public function getTimeAttribute()
    {
        return $this->created_at->diffForHumans();
    }


    public function markAsRead()
    {
        $this->viewed = 1;
        $this->save();
    }

}
