<?php

namespace App\Notifications;

use App\Models\Auth\User;
use App\Models\Job\CandidateProfile;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use NotificationChannels\Telegram\TelegramMessage;
use NotificationChannels\WebPush\WebPushMessage;

class CandidateOpenContact extends UserNotifyAbstract
{

    protected User $candidate;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(User $candidate)
    {
        //
        $this->candidate = $candidate;
    }


    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->from(config('mail.from.address', 'support@jobzz.ru'), config('mail.from.name', 'Jobzz Support'))
            ->subject("Кандидат открыл свои контакты")
            ->greeting("Здравствуйте, " . $notifiable->name . '!')
            ->line("Кандидат " . $this->candidate->name . " (" . $this->candidate->position . ") открыл вам свои контакты\n")
            ->action('Перейти к сообщениям', url('/messenger'));
    }

    public function toTelegram($notifiable)
    {
        $url = url('/messenger');

        $content = 'Здравствуйте, ' . $notifiable->name . "!\n";
        $content .= "Кандидат " . $this->candidate->name . " (" . $this->candidate->position . ") открыл вам свои контакты\n";

        return TelegramMessage::create()
            // Optional recipient user id.
            ->to($notifiable->telegram_chat_id)
            // Markdown supported.
            ->content($content)
            ->button("Перейти к сообщениям", $url);
    }

    public function toWebPush($notifiable, $notification)
    {

        $url = url('/messenger');

        $content = 'Здравствуйте, ' . $notifiable->name . "!\n";
        $content .= "Кандидат " . $this->candidate->name . " (" . $this->candidate->position . ") открыл вам свои контакты\n";

        return (new WebPushMessage)
            ->title('Кандидат открыл свои контакты')
            ->icon('/images/icons/icon-192x192.png')
            ->body($content)
            ->action("Перейти к сообщениям", $url)
            ->tag('messenger')
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
