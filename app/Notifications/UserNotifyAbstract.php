<?php

namespace App\Notifications;

use App\Models\Auth\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;
use NotificationChannels\Telegram\TelegramChannel;
use NotificationChannels\WebPush\WebPushChannel;

abstract class UserNotifyAbstract extends Notification implements ShouldQueue
{
    use Queueable;

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via(User $notifiable)
    {


        $channels = [];
        if (config('services.telegram-bot-api.enable') && $notifiable->notifySettings->telegram_notify && !empty($notifiable->telegram_chat_id)) {
            $channels[] = TelegramChannel::class;
        }
        if ($notifiable->notifySettings->email_notify && !empty($notifiable->email)) {
            $channels[] = 'mail';
        }
        if ($notifiable->notifySettings->push_notify) {
            $channels[] = WebPushChannel::class;
        }
        return $channels;
    }
}