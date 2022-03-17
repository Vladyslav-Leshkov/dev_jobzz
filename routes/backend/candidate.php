<?php


use App\Http\Controllers\Backend\Candidate\CandidateController;

Route::group([
    'prefix' => 'candidate',
    'as' => 'candidate.',
], function () {
    Route::get('', [CandidateController::class, 'index'])->name('index');
    Route::get('{user}', [CandidateController::class, 'show'])->name('show');
    Route::get('{user}/open-data', [CandidateController::class, 'openData'])->name('open-data');
});
