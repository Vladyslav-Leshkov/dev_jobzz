<?php

use App\Http\Controllers\Backend\Messenger\MessengerController;

Route::get('/messenger', [MessengerController::class, 'index'])->name('messenger.index');
