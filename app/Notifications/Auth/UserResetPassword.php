<?php

namespace App\Notifications\Auth;

use Illuminate\Auth\Notifications\ResetPassword;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Support\Facades\Lang;

class UserResetPassword extends ResetPassword
{
    public function toMail($notifiable)
    {
        $url = url(route('frontend.auth.password.reset', [
            'token' => $this->token,
            'email' => $notifiable->getEmailForPasswordReset(),
        ], false));

        return $this->buildMailMessage($url);
    }

    /**
     * Get the reset password notification mail message for the given URL.
     *
     * @param string $url
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    protected function buildMailMessage($url)
    {
        return (new MailMessage)
            ->from(config('mail.from.address', 'support@jobzz.ru'), config('mail.from.name', 'Jobzz Support'))
            ->subject(Lang::get('Reset Password Notification'))
            ->line(Lang::get('We received a request to change the password for the Jobzz account.'))
            ->action(Lang::get('Reset Password'), $url)
            ->line(Lang::get('The password reset link has a lifespan of :count minutes.', ['count' => config('auth.passwords.' . config('auth.defaults.passwords') . '.expire')]))
            ->line(Lang::get('If you didn\'t ask for a password reset, just ignore the email.'));
    }
}
