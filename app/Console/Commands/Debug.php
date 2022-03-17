<?php

namespace App\Console\Commands;

use App\Events\AdminNotificationEvent;
use App\Models\Common\NotificationItem;
use App\Models\Job\Offer;
use App\Services\MessengerService;
use Illuminate\Console\Command;

class Debug extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'debug:run';

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
        $notification = NotificationItem::create([
            'type' => 'info',
            'role' => 'admin',
            'icon' => 'user-check',
            'title' => "Зарегистрирован новый рекрутер",
            'message' => "Рекрутер требует модерации",
        ]);
        AdminNotificationEvent::dispatch($notification);
    }
}
