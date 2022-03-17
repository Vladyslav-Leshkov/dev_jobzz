<?php

namespace App\Notifications;

use App\Models\Auth\User;
use App\Models\Job\Vacancy;

use Illuminate\Notifications\Messages\MailMessage;

use NotificationChannels\Telegram\TelegramMessage;
use NotificationChannels\WebPush\WebPushMessage;

class RecruiterJobOffer extends UserNotifyAbstract
{

    protected User $recruiter;
    protected Vacancy $vacancy;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(User $recruiter, Vacancy $vacancy)
    {
        //
        $this->recruiter = $recruiter;
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
        return (new MailMessage)
            ->from(config('mail.from.address', 'support@jobzz.ru'), config('mail.from.name', 'Jobzz Support'))
            ->subject("Новое предложение вакансии")
            ->greeting("Здравствуйте, " . $notifiable->name . '!')
            ->line("Рекрутер {$this->recruiter->name} ({$this->recruiter->company->title}) предлагает вам вакансию {$this->vacancy->title}")
            ->action('Перейти к сообщениям', url('/messenger'));
    }

    public function toTelegram(User $notifiable)
    {
        $url = url('/messenger');

        $content = 'Здравствуйте, ' . $notifiable->name . "!\n";
        $content .= "Рекрутер {$this->recruiter->name} ({$this->recruiter->company->title}) предлагает вам вакансию {$this->vacancy->title}\n";

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
        $content .= "Рекрутер {$this->recruiter->name} ({$this->recruiter->company->title}) предлагает вам вакансию {$this->vacancy->title}\n";

        return (new WebPushMessage)
            ->title('Новое предложение вакансии')
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
