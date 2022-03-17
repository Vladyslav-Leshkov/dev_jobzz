<?php

namespace App\Models\Auth\Traits\Notifications;

use App\Notifications\Auth\UserResetPassword;

trait UseUserNotifications
{
    /**
     * Send the password reset notification.
     *
     * @param  string  $token
     *
     * @return void
     */
    public function sendPasswordResetNotification($token)
    {
        $this->notify(new UserResetPassword($token));
    }
}
