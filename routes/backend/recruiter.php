<?php

use App\Http\Controllers\Backend\Recruiter\RecruiterController;

Route::group([
    'prefix' => 'recruiter',
    'as' => 'recruiter.',
], function () {
    Route::get('', [RecruiterController::class, 'index'])->name('index');
    Route::get('{user}', [RecruiterController::class, 'show'])->name('show');
    Route::get('{user}/vacancies', [RecruiterController::class, 'vacancies'])->name('vacancy.index');
    Route::get('{user}/vacancy/{vacancy}', [RecruiterController::class, 'showVacancy'])->name('vacancy.show');
    Route::get('{user}/payouts', [RecruiterController::class, 'payouts'])->name('payouts');
});
