<?php

use App\Http\Controllers\Frontend\Vacancy\CategoryController;

Route::group([
    'prefix' => 'categories',
    'as' => 'category.',
], function () {
    Route::get('', [CategoryController::class, 'index'])->name('index');
    Route::get('{type}', [CategoryController::class, 'type'])->name('type');
});



