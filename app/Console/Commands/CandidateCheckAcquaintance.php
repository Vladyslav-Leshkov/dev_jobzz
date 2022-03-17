<?php

namespace App\Console\Commands;

use App\Models\Auth\User;
use App\Models\Job\PushQuestion;
use App\Services\Frontend\Job\PushQuestionService;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;

class CandidateCheckAcquaintance extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'candidate:check-acquaintance';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Вопрос о найме каждые три дня';

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
        $candidates = User::candidates()->with('candidate_profile')->whereHas('openDatas', function ($q) {
            return $q->whereDate('created_at', '<=', Carbon::now()->subDays(3))->whereDate('created_at', '>=', Carbon::now()->subDays(10));
        })->get();

        foreach ($candidates as $candidate) {
            if ($candidate->pushQuestions()->where('type', PushQuestion::TYPE_ACQUAINTANCE)
                    ->whereDate('starts_at', '>=', Carbon::now()->addDays(3))->count() === 0) {
                PushQuestionService::acquaintanceQuestion($candidate);
            }
        }

        return 0;
    }
}
