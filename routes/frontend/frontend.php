<?php

use App\Http\Controllers\Frontend\Content\DownloadController;
use App\Http\Controllers\Frontend\HomeController;
use App\Http\Controllers\LocaleController;
use Illuminate\Support\Facades\Route;

Route::group([
    'as' => 'frontend.',
], function () {
    Route::get('/', [HomeController::class, 'index'])->name('home.index');
    Route::get('/lang/{locale}', [LocaleController::class, 'change'])->name('set-locale');
    Route::get('/download', [DownloadController::class, 'download'])->name('download');

    require __DIR__ . '/auth.php';
    require __DIR__ . '/profile.php';
    require __DIR__ . '/vacancy.php';
    require __DIR__ . '/candidate.php';
    require __DIR__ . '/recruiter.php';
    require __DIR__ . '/company.php';
    require __DIR__ . '/messenger.php';
    require __DIR__ . '/categories.php';
});
