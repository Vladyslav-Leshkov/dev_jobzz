<?php

use App\Http\Controllers\Frontend\Messenger\MessengerController;

Route::group([
    'prefix' => 'messenger',
    'as' => 'messenger.',
    'middleware' => 'auth:sanctum',
], function () {
    Route::get('', [MessengerController::class, 'index'])->name('index');

    Route::get('contacts', [MessengerController::class, 'fetchContacts'])->name('contacts.fetch');
    Route::get('unread', [MessengerController::class, 'unread'])->name('messages.unread');
    Route::get('unread-messages', [MessengerController::class, 'unreadMessages'])->name('messages.unread-messages');
    Route::patch('update-message', [MessengerController::class, 'updateMessage'])->name('messages.update-message');
    Route::get('download/{fileName}', [MessengerController::class, 'download'])->name('messages.download');


    Route::get('{user}/last-messages', [MessengerController::class, 'lastMessages'])->name('users.last-messages');
    Route::get('{user}/resume', [MessengerController::class, 'resume'])->name('users.resume');
    Route::get('{user}/vacancies', [MessengerController::class, 'vacancies'])->name('users.vacancies');
    Route::get('{user}/fetch-messages', [MessengerController::class, 'fetchMessages'])->name('messages.fetch');
    Route::post('{user}/seen-message', [MessengerController::class, 'seenMessage'])->name('messages.seen');
    Route::post('{user}/send-message', [MessengerController::class, 'sendMessage'])->name('messages.send');

});


