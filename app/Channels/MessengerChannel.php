<?php

namespace App\Channels;

use App\Models\Auth\User;
use App\Services\MessengerService;
use Illuminate\Notifications\Notification;

class MessengerChannel
{
    /**
     * Отправить переданное уведомление.
     *
     * @param mixed $notifiable
     * @param Notification $notification
     *
     * @return void
     */
    public function send($notifiable, Notification $notification)
    {
        $message = $notification->toMessenger($notifiable);

        MessengerService::sendMessage(User::SUPPORT_USER_ID, $notifiable->id, [
            'body' => $message
        ], true);
    }
}
