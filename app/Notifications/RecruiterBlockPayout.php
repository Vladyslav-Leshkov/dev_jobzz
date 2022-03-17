<?php

namespace App\Notifications;

use App\Channels\MessengerChannel;
use App\Models\Job\Payout;
use Illuminate\Bus\Queueable;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;
use NotificationChannels\WebPush\WebPushChannel;
use NotificationChannels\WebPush\WebPushMessage;

class RecruiterBlockPayout extends Notification
{
    use Queueable;

    public $payouts;

    /**
     * Create a new notification instance.
     *
     * @param Payout[]|Collection $payouts
     *
     * @return void
     */
    public function __construct($payouts = [])
    {
        //
        $this->payouts = $payouts;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     *
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail', MessengerChannel::class, WebPushChannel::class];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
     *
     * @return MailMessage
     */
    public function toMail($notifiable)
    {
        $message = (new MailMessage)
            ->from(config('mail.from.address', 'support@jobzz.ru'), config('mail.from.name', 'Jobzz Support'))
            ->subject("Оплата услуг")
            ->greeting("Здравствуйте, {$notifiable->name}");

        foreach ($this->payouts as $payout) {
            $message->line($payout->pay_before->format('d.m.Y') . ' истек срок оплаты за кандидата ' . $payout->candidate->position);
        }
        $message->line('Ваш аккаунт был заблокирован.');
        $message->line('Пожалуйста совершите оплату и ваш аккаунт будет разблокирован автоматически.');
        $message->line('Если ваш аккаунт был заблокирован по ошибке, обратитесь в поддержку на нашем сайте.');

        return $message;
    }

    public function toMessenger($notifiable)
    {
        $message = "<div>Здравствуйте, {$notifiable->name}</div>";
        foreach ($this->payouts as $payout) {
            $message .= '<div>' . $payout->pay_before->format('d.m.Y') . ' истек срок оплаты за кандидата ' . $payout->candidate->position . '</div>';
        }
        $message .= '<div>Ваш аккаунт был заблокирован.</div>';
        $message .= '<div>Пожалуйста совершите оплату и ваш аккаунт будет разблокирован автоматически.</div>';
        $message .= '<div>Если ваш аккаунт был заблокирован по ошибке, обратитесь в поддержку на нашем сайте.</div>';
        return $message;
    }

    public function toWebPush($notifiable, $notification)
    {


        $content = 'Здравствуйте, ' . $notifiable->name . "!\n";
        foreach ($this->payouts as $payout) {
            $content .= $payout->pay_before->format('d.m.Y') . ' истек срок оплаты за кандидата ' . $payout->candidate->position . "\n";
        }
        $content .= "Пожалуйста совершите оплату и ваш аккаунт будет разблокирован автоматически.\n";
        $content .= "Если ваш аккаунт был заблокирован по ошибке, обратитесь в поддержку на нашем сайте.\n";

        return (new WebPushMessage)
            ->title('Ваш аккаунт был заблокирован.')
            ->icon('/images/icons/icon-192x192.png')
            ->body($content)
            ->tag('support')
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
     *
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
