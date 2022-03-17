<?php

use App\Http\Controllers\Backend\Role\RoleController;

Route::group([
    'namespace' => 'Auth',
    'prefix' => 'role',
    'as' => 'role.',
], function () {
    Route::get('/', [RoleController::class, 'index'])->name('index');

    Route::get('create', [RoleController::class, 'create'])->name('create');

    Route::post('/', [RoleController::class, 'store'])->name('store');

    Route::group(['prefix' => '{role}'], function () {
        Route::get('edit', [RoleController::class, 'edit'])->name('edit');

        Route::patch('/', [RoleController::class, 'update'])->name('update');
        Route::delete('/', [RoleController::class, 'destroy'])->name('destroy');
    });
});
