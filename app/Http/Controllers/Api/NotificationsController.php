<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Common\NotificationItem;
use App\Models\Job\NotifySettings;
use Illuminate\Http\Request;

class NotificationsController extends Controller
{
    //

    public function index(Request $request)
    {
        $user = current_user();
        $role = $user->type;

        $page = $request->input('page', 1);
        $onpage = $request->input('onpage', 5);
        $skip = ($page - 1) * $onpage;

        return NotificationItem::query()
            ->where('viewed', 0)
            ->where(function ($q) use ($user, $role) {
                return $q->where('user_id', $user->id)
                    ->orWhere('role', $role)
                    ->orWhere(function ($sq) {
                        $sq->whereNull('role')->whereNull('user_id');
                    });
            })
            ->orderBy('created_at', 'desc')->skip($skip)->take($onpage)->get();
    }


    public function last(Request $request)
    {

    }

    public function subscribe(Request $request)
    {
        $user = current_user();
        $action = $request->input('action', '');
        if ($action === 'create') {
            $settings = $user->notifySettings ?? new NotifySettings(['user_id' => $user->id]);
            $settings->push_notify = 1;
            $settings->save();
            $user->updatePushSubscription($request->endpoint, $request->key, $request->token);
        }
        if ($action === 'update') {
            $user->updatePushSubscription($request->endpoint, $request->key, $request->token);
        }
        if ($action === 'delete') {
            $user->deletePushSubscription($request->endpoint);
        }
        return response()->json(['result' => 'success']);
    }


    public function markRead(NotificationItem $notification)
    {
        $notification->markAsRead();
        return response()->json(['result' => 'success']);
    }
}
