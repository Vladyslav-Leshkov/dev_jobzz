<?php

use App\Http\Controllers\Frontend\Candidate\CandidateController;
use Illuminate\Support\Facades\Route;

Route::group([
    'prefix' => 'candidates',
    'as' => 'candidate.',
    'middleware' => 'auth:sanctum',
], function () {
    Route::get('', [CandidateController::class, 'index'])->name('index');
    Route::get('{profile}', [CandidateController::class, 'show'])->name('show');
    Route::get('{profile}/resume', [CandidateController::class, 'resume'])->name('resume');
    Route::post('{profile}/offer', [CandidateController::class, 'offer'])->name('offer')->middleware('auth.recruiter');
});
