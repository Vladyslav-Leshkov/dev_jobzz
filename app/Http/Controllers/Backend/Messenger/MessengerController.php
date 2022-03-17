<?php

namespace App\Http\Controllers\Backend\Messenger;

use App\Http\Controllers\Controller;
use App\Services\MessengerService;

class MessengerController extends Controller
{
    //

    public function index()
    {
        $current_user = current_user()->shortInfo();
        $support_user = MessengerService::getSupportUser($current_user['id']);
        $contacts = current_user()->candidateContacts();

        return view('backend.messenger.index', compact('current_user', 'support_user', 'contacts'));
    }
}
