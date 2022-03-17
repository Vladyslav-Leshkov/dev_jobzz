<?php

use App\Http\Controllers\Backend\Vacancy\DeletedVacancyController;
use App\Http\Controllers\Backend\Vacancy\VacancyController;

Route::group([
    'namespace' => 'Vacancy',
    'prefix' => 'vacancy',
    'as' => 'vacancy.',
], function () {
    Route::get('/{status?}', [VacancyController::class, 'index'])->name('index')->where(['status' => '(active|blocked|hold|archived|anonymous|deleted)']);

    Route::get('{vacancy}', [VacancyController::class, 'edit'])->name('edit');
    Route::patch('{vacancy}', [VacancyController::class, 'update'])->name('update');
    Route::delete('{vacancy}', [VacancyController::class, 'destroy'])->name('destroy');

    Route::patch('{vacancy}/status/{status}', [VacancyController::class, 'status'])->name('status')->where(['status' => '[0,1,2,3,4]']);


    Route::group(['prefix' => '{deletedVacancy}'], function () {
        Route::patch('restore', [DeletedVacancyController::class, 'update'])->name('restore');
        Route::delete('permanently-delete', [DeletedVacancyController::class, 'destroy'])->name('permanently-delete');
    });
});
