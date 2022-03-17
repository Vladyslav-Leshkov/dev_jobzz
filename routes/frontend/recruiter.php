<?php

use App\Http\Controllers\Frontend\Recruiter\RecruiterController;
use Illuminate\Support\Facades\Route;

Route::group([
    'prefix' => 'recruiter',
    'as' => 'recruiter.',
], function () {
    Route::get('confirm', [RecruiterController::class, 'confirm'])->name('confirm')->middleware('auth.candidate');
    Route::get('{user}', [RecruiterController::class, 'show'])->name('show');

});
