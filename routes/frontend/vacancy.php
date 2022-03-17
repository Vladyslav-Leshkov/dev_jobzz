<?php

use App\Http\Controllers\Frontend\Vacancy\VacancyController;
use Illuminate\Support\Facades\Route;

Route::group([
    'prefix' => 'vacancies',
    'as' => 'vacancy.',
], function () {
    Route::get('', [VacancyController::class, 'index'])->name('index');
    Route::get('my', [VacancyController::class, 'my'])->name('my')->middleware('auth.candidate');
    Route::get('sp-{specialization}', [VacancyController::class, 'specialization'])->name('specialization');
    Route::get('{vacancy}', [VacancyController::class, 'show'])->name('show');
    Route::post('{vacancy}/offer', [VacancyController::class, 'offer'])->name('offer');
    Route::post('{offer}/confirm', [VacancyController::class, 'confirm'])->name('confirm')->middleware('auth.candidate');

});
