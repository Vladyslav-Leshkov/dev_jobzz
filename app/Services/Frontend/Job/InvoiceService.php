<?php

namespace App\Services\Frontend\Job;

use App\Models\Auth\User;
use App\Models\Job\Currency;
use App\Models\Job\Invoice;
use App\Models\Job\PaymentMethod;
use App\Models\Job\Payout;
use App\Models\Location\Country;
use App\Services\BaseService;
use Exception;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Throwable;

class InvoiceService extends BaseService
{
    /**
     * @param $params
     *
     * @return Invoice
     */
    public static function createInvoice($params)
    {
        $recruiter = isset($params['recruiter_id']) ? User::find($params['recruiter_id']) : current_user();

        self::cancelOldInvoices($params['items']);

        $items = $recruiter->payouts()->with(['candidate'])->whereIn('id', $params['items'])->get();

        $currency = $params['currency'] ?? 'RUB';
        $total = $items->sum('amount');
        if ($currency !== 'RUB') {
            $total = Currency::convertAmount($total, $currency);
        }
        $payment_method = PaymentMethod::whereSlug($params['payment_method'])->firstOrFail();

        $payer = [
            'name' => $params['name'] ?? $recruiter->name,
            'phone' => $params['phone'] ?? '',
            'email' => $params['email'] ?? '',
            'inn' => $params['vat_id'] ?? '',
            'country_id' => $params['country_id'] ?? null,
            'country' => isset($params['country_id']) ? Country::getNameById($params['country_id'], 'en') : '',
            'street_address1' => $params['street_address1'] ?? '',
            'eu_vat_id' => $params['eu_vat_id'] ?? '',
            'postcode' => $params['postcode'] ?? '',
        ];

        $recruiter->updateAddress($payer, $payment_method->slug);

        $invoice = new Invoice();
        $invoice->user_id = $recruiter->id;
        $invoice->amount = $total;
        $invoice->currency = $currency;
        $invoice->payment_method = $payment_method->slug;
        $invoice->payment_method_id = $payment_method->id;
        $invoice->payment_info = [
            'payer' => $payer,
            'items' => $items->toArray(),
        ];

        $invoice->save();
        $invoice->payouts()->saveMany($items);
        $invoice->payouts()->update(['status' => Payout::STATUS_PENDING]);

        return $invoice;
    }

    /**
     * Отменяет устаревшие инвойсы
     *
     * @param array $items
     */
    public static function cancelOldInvoices(array $items = [])
    {
        $invoices = Invoice::query()->whereHas('payouts', function (Builder $q) use ($items) {
            return $q->whereIn('id', $items);
        })->get();

        /**
         * @var Invoice $invoice
         */
        foreach ($invoices as $invoice) {
            $invoice->status = Invoice::STATUS_REJECTED;
            $invoice->save();
        }
    }

    /**
     * Помечает инвойс как оплаченный и начисляет бонусы
     *
     * @param Invoice $invoice
     *
     * @throws Throwable
     *
     * @return bool
     */
    public static function markPayed(Invoice $invoice): bool
    {
        DB::beginTransaction();

        try {
            if ($invoice->status !== Invoice::STATUS_PAYED) {
                $user = $invoice->user;
                $invoice->paid_at = Carbon::now();
                $invoice->status = Invoice::STATUS_PAYED;
                $invoice->save();
                $user->addHires($invoice->payouts()->count());
                $invoice->payouts()->update(['status' => Payout::STATUS_PAID, 'paid_at' => now()]);
                if ($user->status === User::STATUS_BLOCKED && !$user->hasLatePayouts()) {
                    $user->status = User::STATUS_ACTIVE;
                    $user->save();
                }
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
     * @param Invoice $invoice
     *
     * @throws Throwable
     *
     * @return bool
     */
    public static function markRejected(Invoice $invoice): bool
    {
        DB::beginTransaction();

        try {
            $user = $invoice->user;
            $invoice->payouts()->update(['status' => Payout::STATUS_REJECTED]);
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
