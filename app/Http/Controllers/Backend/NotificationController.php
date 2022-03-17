<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Common\NotificationItem;
use Illuminate\Http\Request;

class NotificationController extends Controller
{
    //
    public function index()
    {
        return view('backend.notifications.index');
    }
}
