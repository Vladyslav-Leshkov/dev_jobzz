<?php

use App\Http\Controllers\Backend\SiteOptionsController;
use Illuminate\Support\Facades\Route;

/**
 * Настройки сайта. Номера телефонов, эмейлов и т.п.
 */
Route::get('/site-options', [SiteOptionsController::class, 'index'])->name('site-options.index');
Route::patch('/site-options', [SiteOptionsController::class, 'update'])->name('site-options.update');
