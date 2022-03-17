<?php

namespace App\Console\Commands;

use App\Models\Job\Vacancy;
use App\Services\Frontend\Job\PushQuestionService;
use App\Services\Frontend\Job\VacancyService;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;

class VacancyCheckActivity extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'vacancy:check-activity';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Автоматическое закрытие вакансий истечению 30 дней';

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
        $vacancies = Vacancy::active()->whereDate('created_at', '<=', Carbon::now()->subDays(30))->get();
        foreach ($vacancies as $vacancy)
        {
            VacancyService::archive($vacancy);
            PushQuestionService::vacancyClosedCandidates($vacancy);
            PushQuestionService::vacancyClosedRecruiter($vacancy);
        }

        return 0;
    }
}
