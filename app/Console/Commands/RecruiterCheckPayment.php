<?php

namespace App\Console\Commands;

use App\Models\Auth\User;
use App\Models\Job\Payout;
use App\Notifications\RecruiterBlockPayout;
use App\Notifications\RecruiterWarnPayout;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Database\Eloquent\Builder;

class RecruiterCheckPayment extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'recruiter:check-payment';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Отправляет уведомление рекрутеру об оплате';

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
        // блокировка пользователей в случае неуплаты
        $recruitersToBlock = User::recruiters()->onlyActive()->whereHas('payouts', function ($q) {
            return $q->toBlock();
        })->with('payouts', function ($q) {
            return $q->toBlock();
        })->get();

        foreach ($recruitersToBlock as $recruiter) {

            $recruiter->notify(new RecruiterBlockPayout($recruiter->payouts));
            $recruiter->status = User::STATUS_BLOCKED;
            $recruiter->save();
        }

        // предупреждение пользователей об оплате
        $recruitersToNote = User::recruiters()->onlyActive()->whereHas('payouts', function ($q) {
            return $q->toWarn();
        })->with('payouts', function ($q) {
            return $q->toWarn();
        })->get();

        foreach ($recruitersToNote as $recruiter) {
            $recruiter->payouts()->toWarn()->update(['user_warn_sent' => 1]);
            $recruiter->notify(new RecruiterWarnPayout($recruiter->payouts));
        }


        return 0;
    }
}
