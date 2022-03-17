<?php

use App\Http\Controllers\Api\CandidateController;
use App\Http\Controllers\Api\NotificationsController;
use App\Http\Controllers\Api\PushQuestionController;
use App\Http\Controllers\Api\RecruiterController;
use App\Http\Controllers\Api\VacancyController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::group([
    'prefix' => 'candidate',
    'as' => 'candidate.',
], function () {
    Route::get('', [CandidateController::class, 'index'])->name('index');
    Route::get('{profile}', [CandidateController::class, 'show'])->name('show');
});

Route::group([
    'prefix' => 'vacancy',
    'as' => 'vacancy.',
], function () {
    Route::get('', [VacancyController::class, 'index'])->name('index');
    Route::get('{vacancy}', [VacancyController::class, 'show'])->name('show');
});



Route::group([
    'prefix' => 'recruiter',
    'as' => 'recruiter.',
], function () {
    Route::get('amount-to-pay', [RecruiterController::class, 'amountToPay'])->name('amount-to-pay')
        ->middleware(['auth:sanctum', 'auth.recruiter']);

    Route::post('report-hiring', [RecruiterController::class, 'reportHiring'])->name('report-hiring')
        ->middleware(['auth:sanctum', 'auth.recruiter']);
});

Route::group([
    'prefix' => 'notifications',
    'as' => 'notifications.',
    'middleware' => 'auth:sanctum',
], function () {
    Route::get('', [NotificationsController::class, 'index'])->name('index');
    Route::post('subscribe', [NotificationsController::class, 'subscribe'])->name('subscribe');
    Route::get('last', [NotificationsController::class, 'last'])->name('last');
    Route::post('{notification}/mark-read', [NotificationsController::class, 'markRead'])->name('mark-read');
});

Route::group([
    'prefix' => 'push-questions',
    'as' => 'push-questions.',
    'middleware' => 'auth:sanctum',
], function () {
    Route::get('', [PushQuestionController::class, 'index'])->name('index');
    Route::post('{question}', [PushQuestionController::class, 'answer'])->name('answer');
});
