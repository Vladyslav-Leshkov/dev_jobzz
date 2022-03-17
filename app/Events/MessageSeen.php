<?php

namespace App\Events;

use App\Models\Auth\User;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Contracts\Broadcasting\ShouldBroadcastNow;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class MessageSeen implements ShouldBroadcastNow
{
    use Dispatchable, InteractsWithSockets, SerializesModels;


    protected int $recipient_id;

    public int $user_id;

    public array $ids = [];

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($recipient_id, $user_id, $ids)
    {
        //
        $this->recipient_id = $recipient_id;
        $this->user_id = $user_id;
        $this->ids = $ids;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        if($this->recipient_id === User::SUPPORT_USER_ID){
            return new PrivateChannel("Messenger.Support");
        }
        return new PrivateChannel("Messenger.User.{$this->recipient_id}");
    }
}
