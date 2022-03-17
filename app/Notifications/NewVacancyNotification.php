<?php

namespace App\Notifications;

use App\Models\Auth\User;
use App\Models\Job\CandidateProfile;
use App\Models\Job\Vacancy;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use NotificationChannels\Telegram\TelegramChannel;
use NotificationChannels\Telegram\TelegramMessage;
use NotificationChannels\WebPush\WebPushMessage;

class NewVacancyNotification extends UserNotifyAbstract
{


    protected Vacancy $vacancy;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Vacancy $vacancy)
    {
        //
        $this->vacancy = $vacancy;
    }


    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return MailMessage
     */
    public function toMail($notifiable)
    {
        $vacancy_url = url($this->vacancy->url);
        return (new MailMessage)
            ->from(config('mail.from.address', 'support@jobzz.ru'), config('mail.from.name', 'Jobzz Support'))
            ->subject("Новая вакансия по вашему профилю")
            ->greeting("Здравствуйте, " . $notifiable->name . '!')
            ->line("На Jobzz.ru появилась новая вакансия {$this->vacancy->title}, которая может подойти по вашему профилю")
            ->action('Перейти к вакансии', $vacancy_url);
    }

    public function toTelegram(User $notifiable)
    {
        $vacancy_url = url($this->vacancy->url);

        $content = 'Здравствуйте, ' . $notifiable->name . "!\n";
        $content .= "На Jobzz.ru появилась новая вакансия {$this->vacancy->title}, которая может подойти по вашему профилю\n";

        return TelegramMessage::create()
            // Optional recipient user id.
            ->to($notifiable->telegram_chat_id)
            // Markdown supported.
            ->content($content)
            ->button('Перейти к вакансии', $vacancy_url);
    }

    public function toWebPush($notifiable, $notification)
    {

        $vacancy_url = url($this->vacancy->url);

        $content = 'Здравствуйте, ' . $notifiable->name . "!\n";
        $content .= "На Jobzz.ru появилась новая вакансия {$this->vacancy->title}, которая может подойти по вашему профилю\n";

        return (new WebPushMessage)
            ->title('Новая вакансия по вашему профилю')
            ->icon('/images/icons/icon-192x192.png')
            ->body($content)
            ->action("Перейти к вакансии", $vacancy_url)
            ->tag('vacancy')
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
