<?php

namespace App\Events;

use App\Models\Common\NotificationItem;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class UserNotificationEvent
{
    use Dispatchable, InteractsWithSockets, SerializesModels;


    public NotificationItem $notification;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(NotificationItem $notification)
    {
        //
        $this->notification = $notification;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return  new PrivateChannel('App.Models.User.'.$this->notification->user_id);
    }
}
