<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param Schedule $schedule
     *
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')->hourly();
        //$schedule->command('schedule:test')->everyMinute();

        $schedule->command('course:update')->twiceDaily(9, 13)->withoutOverlapping()
            ->appendOutputTo(storage_path('logs/course-update.log'));

        $schedule->command('vacancy:check-activity')->dailyAt('03:00')->withoutOverlapping();

        $schedule->command('candidate:check-activity')->dailyAt('04:00')->withoutOverlapping();

        $schedule->command('candidate:check-acquaintance')->dailyAt('10:00')->withoutOverlapping();

        $schedule->command('recruiter:check-payment')->dailyAt('10:00')->withoutOverlapping();

        $schedule->command('notify:new-chat-messages')->everyTenMinutes()->withoutOverlapping();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }
}
