<?php

namespace App\Services\Frontend\Job;

use App\Models\Auth\User;
use App\Models\Job\Offer;
use App\Models\Job\Payout;
use App\Services\BaseService;
use Exception;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class PayoutService extends BaseService
{
    /**
     * Создание платежки по вакансии если она не была создана ранее
     *
     * @param Offer $offer
     *
     * @return Payout
     */
    public static function createIfNotExists(Offer $offer)
    {
        $payout = Payout::where([
            ['recruiter_id', $offer->recruiter_id],
            ['candidate_id', $offer->candidate_id],
        ])->first();

        if (($payout === null || $payout->status === Payout::STATUS_REJECTED) && $offer->profile->price > 0) {
            $payout = Payout::create([
                'vacancy_id' => $offer->vacancy_id,
                'candidate_id' => $offer->candidate_id,
                'recruiter_id' => $offer->recruiter_id,
                'status' => Payout::STATUS_NEW,
                'released_to_work' => $offer->released_to_work,
                'pay_before' => $offer->released_to_work->addMonth(),
                'amount' => $offer->profile->price,
                'currency' => 'RUB',
            ]);
            // событие генерируется в модели в методе boot
        }

        return $payout;
    }


    /**
     * Помечает платежку как оплаченную и начисляет бонусы
     *
     * @param Payout $payout
     *
     * @return bool
     *
     */
    public static function markPayed(Payout $payout): bool
    {
        DB::beginTransaction();

        try {
            $user = $payout->recruiter;
            $payout->paid_at = Carbon::now();
            $user->addHires(1);
            $payout->status = Payout::STATUS_PAID;
            $payout->save();
            if ($user->status === User::STATUS_BLOCKED && !$user->hasLatePayouts()) {
                $user->status = User::STATUS_ACTIVE;
                $user->save();
            }
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }

        DB::commit();

        return true;
    }

    /**
     * Помечает инвойс как отмененный, бонусы не начисляются, пользователь разблокируется
     *
     * @param Payout $payout
     *
     * @return bool
     *
     */
    public static function markRejected(Payout $payout): bool
    {
        DB::beginTransaction();

        try {
            $user = $payout->recruiter;
            $payout->status = Payout::STATUS_REJECTED;
            $payout->save();
            if ($user->status === User::STATUS_BLOCKED && !$user->hasLatePayouts()) {
                $user->status = User::STATUS_ACTIVE;
                $user->save();
            }
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }

        DB::commit();

        return true;
    }
}
