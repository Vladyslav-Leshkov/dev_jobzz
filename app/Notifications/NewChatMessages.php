<?php

namespace App\Notifications;

use App\Models\Auth\User;
use App\Models\Messenger\ChatMessage;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use League\CommonMark\MarkdownConverter;
use NotificationChannels\Telegram\TelegramChannel;
use NotificationChannels\Telegram\TelegramMessage;
use NotificationChannels\WebPush\WebPushChannel;
use NotificationChannels\WebPush\WebPushMessage;

class NewChatMessages extends UserNotifyAbstract
{

    protected int $count;
    protected $onlyChannel;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($count = 0, $onlyChannel = null)
    {
        //
        $this->count = $count;
        $this->onlyChannel = $onlyChannel;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via(User $notifiable)
    {
        $channels = [];
        if (config('services.telegram-bot-api.enable') && $notifiable->notifySettings->telegram_notify &&
            !empty($notifiable->telegram_chat_id) && ($this->onlyChannel === null || $this->onlyChannel === 'telegram')) {
            $channels[] = TelegramChannel::class;
        }
        if ($notifiable->notifySettings->push_notify && ($this->onlyChannel === null || $this->onlyChannel === 'push')) {
            $channels[] = WebPushChannel::class;
        }
        if ($notifiable->notifySettings->email_notify && !empty($notifiable->email) &&
            ($this->onlyChannel === null || $this->onlyChannel === 'mail')) {
            $channels[] = 'mail';
        }
        return $channels;
    }


    public function toWebPush($notifiable, $notification)
    {

        $url = url('/messenger');
        return (new WebPushMessage)
            ->title('Новое сообщение на сайте Jobzz.ru')
            ->icon('/images/icons/icon-192x192.png')
            ->body($this->getPushText($notifiable))
            ->action('Перейти к сообщениям', $url)
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
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     * @return MailMessage
     */
    public function toMail($notifiable)
    {

        $count = $this->count . ' ' . plural_form($this->count, ['новое сообщение', 'новых сообщений', 'новых сообщений']);

        return (new MailMessage)
            ->from(config('mail.from.address', 'support@jobzz.ru'), config('mail.from.name', 'Jobzz Support'))
            ->subject("Новое сообщение на сайте Jobzz.ru")
            ->greeting("Здравствуйте, " . $notifiable->name . '!')
            ->line("У вас {$count} на сайте Jobzz.ru")
            ->action('Перейти к сообщениям', url('/messenger'));
    }

    public function toTelegram(User $notifiable)
    {
        $url = url('/messenger');
        return TelegramMessage::create()
            // Optional recipient user id.
            ->to($notifiable->telegram_chat_id)
            // Markdown supported.
            ->content($this->getPushText($notifiable))
            ->button("Перейти к сообщениям", $url);
    }

    public function getPushText(User $notifiable)
    {
        $count = $this->count . ' ' . plural_form($this->count, ['новое сообщение', 'новых сообщений', 'новых сообщений']);
        $content = 'Здравствуйте, ' . $notifiable->name . "!\n";
        $content .= "У вас {$count} на сайте Jobzz.ru\n";
        return $content;
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
