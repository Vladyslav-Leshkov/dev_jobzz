<?php

namespace App\Console\Commands;

use App\Models\Auth\NotificationLog;
use App\Models\Auth\User;
use App\Notifications\NewChatMessages;
use App\Services\NotificationService;
use Exception;
use Illuminate\Console\Command;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Log;

class SendChatNotification extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notify:new-chat-messages';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        // Выбираем всех пользователей, у которых включена настройка уведомлений, а также которые не онлайн
        /**
         * @var User[] $recruiters
         */
        $users = User::query()->whereHas('notifySettings', function ($q) {
            return $q->where('notify_message', 1)->where(function ($sq) {
                return $sq->where('email_notify', 1)->orWhere('telegram_notify', 1);
            });
        })->whereDate('last_activity', '<=', Carbon::now()->subMinutes(20))
            ->with('notifySettings')->get();


        foreach ($users as $user) {
            if ($user->notifySettings->email_notify) {
                NotificationService::chatNewMessagesNotification($user);
            }
            if (config('services.telegram-bot-api.enable') && $user->notifySettings->telegram_notify) {
                NotificationService::chatNewMessagesNotification($user, 'telegram');
            }

        }

        return 0;
    }
}
