<?php

use App\Http\Controllers\Backend\TranslationController;
use Illuminate\Support\Facades\Route;

Route::group([
    'prefix' => 'translation',
    'as' => 'translation.',
], function () {
    Route::get('', [TranslationController::class, 'index'])->name('index');
    Route::get('create', [TranslationController::class, 'create'])->name('create');
    Route::post('create', [TranslationController::class, 'store'])->name('store');
    Route::post('publish', [TranslationController::class, 'publish'])->name('publish');
    Route::get('{line}/edit', [TranslationController::class, 'edit'])->name('edit');
    Route::patch('{line}', [TranslationController::class, 'update'])->name('update');
    Route::delete('{line}', [TranslationController::class, 'destroy'])->name('destroy');
});
