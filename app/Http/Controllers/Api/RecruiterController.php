<?php

namespace App\Http\Controllers\Api;

use App\Events\AdminNotificationEvent;
use App\Http\Controllers\Controller;
use App\Http\Requests\ReportHiringRequest;
use App\Mail\AdminHiringReport;
use App\Models\Auth\User;
use App\Models\Common\NotificationItem;
use App\Models\Job\Payout;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Mail;

class RecruiterController extends Controller
{
    public function amountToPay(Request $request)
    {
        $user = current_user();
        $query = Payout::query()
            ->whereIn('status', [Payout::STATUS_NEW, Payout::STATUS_PENDING])
            ->where('recruiter_id', $user->id);

        $amount = (clone $query)->sum('amount');
        $nearest_payout = $query->orderBy('pay_before')->first();

        return [
            'amount_to_pay' => (int)$amount,
            'currency' => 'RUB',
            'pay_before' => $nearest_payout ? $nearest_payout->pay_before->format('d.m.Y') : '',
            'danger' => $nearest_payout ? $nearest_payout->pay_before->lte(Carbon::now()->addDays(3)->endOfDay()) : false,
        ];
    }

    public function reportHiring(ReportHiringRequest $request)
    {
        $user = current_user();

//        $params = $request->validated();
//        $params['from'] = $user->email;
//        Mail::queue(new AdminHiringReport($params));

        $candidate = User::whereEmail($request->email)->first();

        $notification = NotificationItem::create([
            'type' => 'info',
            'role' => 'admin',
            'icon' => 'user-check',
            'title' => "Новое сообщение о найме",
            'message' => "Рекрутер <a href='#'>{$user->name}</a> нанял пользователя <a href='#'>{$candidate->name}</a> ",
        ]);
        broadcast(new AdminNotificationEvent($notification));

        return ['result' => 'success', 'message' => __('Thank you for your message')];
    }
}
