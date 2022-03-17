<?php

namespace App\Notifications;

use App\Models\Messenger\ChatMessage;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use NotificationChannels\Telegram\TelegramChannel;
use NotificationChannels\WebPush\WebPushChannel;
use NotificationChannels\WebPush\WebPushMessage;

class PushChatMessage extends Notification
{
    use Queueable;

    /**
     *
     * @var ChatMessage
     */
    protected $message;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(ChatMessage $message)
    {
        //
        $this->message = $message;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        $channels = [];
        if ($notifiable->notifySettings->push_notify && $notifiable->notifySettings->notify_message) {
            $channels[] = WebPushChannel::class;
        }
        return $channels;
    }


    public function toWebPush($notifiable, $notification)
    {
        $formUser = $this->message->fromUser;

        return (new WebPushMessage)
            ->title('Новое сообщение!')
            ->icon('/images/icons/icon-192x192.png')
            ->body($formUser->name . ': ' . str_limit(strip_tags($this->message->body), 500))
            ->action('Перейти к сообщениям', url('/messenger'))
            ->tag('messenger' . $this->message->id)
            ->vibrate([200, 100, 200])
            ->options(['TTL' => 1000]);
        // ->data(['id' => $notification->id])
        // ->badge()
        // ->dir()
        // ->image()
        // ->lang()
        // ->renotify()
        // ->requireInteraction()
        // ->vibrate()
    }

    /**
     * Get the array representation of the notification.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
