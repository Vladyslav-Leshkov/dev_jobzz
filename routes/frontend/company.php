<?php

use App\Http\Controllers\Frontend\Company\CompanyController;
use Illuminate\Support\Facades\Route;

Route::group([
    'prefix' => 'company',
    'as' => 'company.',
], function () {
    Route::get('{company:slug}', [CompanyController::class, 'show'])->name('show');
});
