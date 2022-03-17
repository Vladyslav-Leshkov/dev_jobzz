<?php

namespace App\Http\Livewire\Backend;

use App\Models\Common\NotificationItem;
use Livewire\Component;

class Notifications extends Component
{
    public function query()
    {
        $user = current_user();
        $role = $user->type;

        $query =  NotificationItem::query()

            ->where(function ($q) use ($user, $role) {
                return $q->where('user_id', $user->id)
                    ->orWhere('role', $role)
                    ->orWhere(function ($sq) {
                        $sq->whereNull('role')->whereNull('user_id');
                    });
            })
            ->orderBy('created_at', 'desc');
        return $query;
    }

    public function render()
    {
        return view('livewire.backend.notifications',  ['notifications'=>$this->query()->paginate(20)]);
    }

    public function delete($id)
    {
        NotificationItem::destroy($id);
    }


    public function markAsView($id)
    {
        $item = NotificationItem::find($id);
        $item->markAsRead();
    }
}
