<?php

namespace App\Console\Commands;

use App\Models\Auth\User;
use App\Notifications\UserDeactivatedLastActivity;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;

/**
 * Class CandidateCheckActivity
 *
 * @package App\Console\Commands
 */
class CandidateCheckActivity extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'candidate:check-activity';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Проверяет активность кандидатов';

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
        $candidates = User::candidates()->where('status', User::STATUS_ACTIVE)
            ->whereDate('last_activity', '<=', Carbon::now()->subDays(45))->get();

        foreach ($candidates as $candidate) {
            $candidate->status = User::STATUS_HIDDEN;
            $candidate->save();
            $candidate->notify(new UserDeactivatedLastActivity());
        }

        return 0;
    }
}
