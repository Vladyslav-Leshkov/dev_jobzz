<?php

namespace App\Notifications;

use App\Models\Auth\User;
use App\Models\Job\CandidateProfile;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use NotificationChannels\Telegram\TelegramChannel;
use NotificationChannels\Telegram\TelegramMessage;
use NotificationChannels\WebPush\WebPushMessage;

class NewCandidateNotification extends UserNotifyAbstract
{


    protected User $candidate;
    protected CandidateProfile $profile;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(User $candidate)
    {
        //
        $this->candidate = $candidate;
        $this->profile = $candidate->candidate_profile ?? $candidate->candidate_profile()->first();
    }


    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return MailMessage
     */
    public function toMail($notifiable)
    {
        $candidate_url = url($this->profile->url);
        return (new MailMessage)
            ->from(config('mail.from.address', 'support@jobzz.ru'), config('mail.from.name', 'Jobzz Support'))
            ->subject("Новый кандидат на вашу вакансию")
            ->greeting("Здравствуйте, " . $notifiable->name . '!')
            ->line("На Jobzz.ru опубликовался кандидат {$this->candidate->position} который может подойти к одной из ваших вакансий")
            ->action('Перейти к профилю кандидата', $candidate_url);
    }

    public function toTelegram(User $notifiable)
    {
        $candidate_url = url($this->profile->url);

        $content = 'Здравствуйте, ' . $notifiable->name . "!\n";
        $content .= "На Jobzz.ru опубликовался кандидат {$this->candidate->position} который может подойти к одной из ваших вакансий\n";

        return TelegramMessage::create()
            // Optional recipient user id.
            ->to($notifiable->telegram_chat_id)
            // Markdown supported.
            ->content($content)
            ->button("Перейти к профилю кандидата", $candidate_url);
    }


    public function toWebPush($notifiable, $notification)
    {

        $candidate_url = url($this->profile->url);

        $content = 'Здравствуйте, ' . $notifiable->name . "!\n";
        $content .= "На Jobzz.ru опубликовался кандидат {$this->candidate->position} который может подойти к одной из ваших вакансий\n";

        return (new WebPushMessage)
            ->title('Новый кандидат на вашу вакансию')
            ->icon('/images/icons/icon-192x192.png')
            ->body($content)
            ->action("Перейти к профилю кандидата", $candidate_url)
            ->tag('candidate')
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
