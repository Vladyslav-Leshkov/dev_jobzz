<?php

use App\Http\Controllers\Backend\Company\CompanyController;

Route::resource('company', CompanyController::class)
    ->only(['index', 'show', 'edit', 'update', 'destroy']);
