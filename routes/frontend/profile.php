<?php

use App\Http\Controllers\Frontend\Profile\PaymentController;
use App\Http\Controllers\Frontend\Profile\ProfileContactsController;
use App\Http\Controllers\Frontend\Profile\ProfileController;
use App\Http\Controllers\Frontend\Profile\ProfileDeleteController;
use App\Http\Controllers\Frontend\Profile\ProfileSettingsController;
use App\Http\Controllers\Frontend\Profile\VacancyController;
use Illuminate\Support\Facades\Route;

Route::any('tinkoff-9017309044/notify', [PaymentController::class, 'paymentNotify'])->name('tinkoff.payment-notify');

Route::group([
    'prefix' => 'profile',
    'as' => 'profile.',
    'middleware' => 'auth',
], function () {
    Route::get('', [ProfileController::class, 'index'])->name('index');

    Route::put('', [ProfileController::class, 'update'])->name('update');

    Route::get('blocked', [ProfileController::class, 'blocked'])->name('blocked');

    Route::get('wizard', [ProfileController::class, 'wizard'])->name('wizard.index');
    Route::put('wizard', [ProfileController::class, 'agree'])->name('wizard.agree')->middleware('auth.recruiter');
    Route::post('wizard', [ProfileController::class, 'store'])->name('wizard.store');

    Route::get('preview', [ProfileController::class, 'preview'])->name('preview');

    Route::get('contacts', [ProfileContactsController::class, 'index'])->name('contact.index');
    Route::patch('contacts', [ProfileContactsController::class, 'update'])->name('contact.update');

    Route::get('delete', [ProfileDeleteController::class, 'index'])->name('delete.index')->middleware('auth.candidate');
    Route::delete('delete', [ProfileDeleteController::class, 'confirm'])->name('delete.confirm')->middleware('auth.candidate');

    Route::patch('change-status/{status}', [ProfileController::class, 'status'])->name('change-status');

    Route::group([
        'prefix' => 'vacancy',
        'as' => 'vacancy.',
        'middleware' => 'auth.recruiter',
    ], function () {
        Route::get('{status?}', [VacancyController::class, 'index'])->name('index')->where('status', 'anonymous|hold|archived');
        Route::get('create', [VacancyController::class, 'create'])->name('create');
        Route::post('', [VacancyController::class, 'store'])->name('store');
        Route::get('{vacancy}/edit', [VacancyController::class, 'edit'])->name('edit');
        Route::patch('{vacancy}/hold', [VacancyController::class, 'hold'])->name('hold');
        Route::get('{vacancy}/candidates', [VacancyController::class, 'candidates'])->name('candidates');
        Route::post('{offer}/confirm', [VacancyController::class, 'confirm'])->name('confirm');
        Route::patch('{vacancy}/close', [VacancyController::class, 'close'])->name('close');
        Route::get('{vacancy}/activate', [VacancyController::class, 'activate'])->name('activate');
        Route::patch('{vacancy}', [VacancyController::class, 'update'])->name('update');
        Route::delete('{vacancy}', [VacancyController::class, 'destroy'])->name('destroy');
    });


    Route::group([
        'prefix' => 'payment',
        'as' => 'payment.',
        'middleware' => 'auth.recruiter',
    ], function () {
        Route::get('', [PaymentController::class, 'index'])->name('index');
        Route::post('', [PaymentController::class, 'create'])->name('create');
        Route::get('success', [PaymentController::class, 'paymentSuccess'])->name('payment-success');
        Route::get('fail', [PaymentController::class, 'paymentFail'])->name('payment-fail');
        Route::get('invoice', [PaymentController::class, 'invoice'])->name('invoice');
        Route::post('invoice', [PaymentController::class, 'order'])->name('order');
        Route::get('invoice/{invoice}', [PaymentController::class, 'success'])->name('success');
        Route::get('invoice/{invoice}/download', [PaymentController::class, 'download'])->name('download');
        Route::get('invoice/{payout}/download-act', [PaymentController::class, 'downloadAct'])->name('download-act');
    });

    Route::group([
        'prefix' => 'settings',
        'as' => 'settings.',
        'middleware' => 'auth',
    ], function () {
        Route::get('', [ProfileSettingsController::class, 'index'])->name('index');
        Route::patch('', [ProfileSettingsController::class, 'update'])->name('update');
    });
});
