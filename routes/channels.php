<?php

use Illuminate\Support\Facades\Broadcast;
use App\Models\Auth\User;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

Broadcast::channel('App.Models.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

Broadcast::channel('Messenger.User.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});

Broadcast::channel('Admin.Notifications', function (User $user){
   return  $user->isAdmin() || $user->isSupport();
});

Broadcast::channel('Messenger.Support', function (User $user){
    return  $user->isAdmin() || $user->isSupport();
});

Broadcast::channel('Public.Notification', function (){
    return  \Illuminate\Support\Facades\Auth::check();
});
