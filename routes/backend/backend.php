<?php

use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\LoginController;
use App\Http\Controllers\Backend\NotificationController;
use Illuminate\Support\Facades\Route;

Route::get('/admin/login', [LoginController::class, 'create'])->middleware('guest')->name('admin.login.create');
Route::post('/admin/login', [LoginController::class, 'store'])->middleware('guest')->name('admin.login.store');
Route::post('/admin/logout', [LoginController::class, 'destroy'])->middleware('auth')->name('admin.logout');

Route::group([
    'prefix' => 'admin',
    'as' => 'admin.',
    'middleware' => 'auth.admin',
], function () {
    Route::get('/', [DashboardController::class, 'index'])->name('dashboard');

    include __DIR__ . '/user.php';
    include __DIR__ . '/role.php';
    include __DIR__ . '/page.php';
    include __DIR__ . '/translation.php';
    include __DIR__ . '/site-options.php';
    include __DIR__ . '/menu.php';
    include __DIR__ . '/vacancy.php';
    include __DIR__ . '/specialization.php';
    include __DIR__ . '/skill.php';
    include __DIR__ . '/company.php';
    include __DIR__ . '/recruiter.php';
    include __DIR__ . '/candidate.php';
    include __DIR__ . '/messenger.php';
    include __DIR__ . '/invoice.php';

    Route::get('notifications', [NotificationController::class, 'index'])->name('notifications.index');
});
