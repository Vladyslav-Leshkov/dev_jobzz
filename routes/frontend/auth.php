<?php

use App\Http\Controllers\Frontend\Auth\ConfirmablePasswordController;
use App\Http\Controllers\Frontend\Auth\EmailVerificationNotificationController;
use App\Http\Controllers\Frontend\Auth\EmailVerificationPromptController;
use App\Http\Controllers\Frontend\Auth\NewPasswordController;
use App\Http\Controllers\Frontend\Auth\PasswordResetLinkController;
use App\Http\Controllers\Frontend\Auth\RegisteredUserController;
use App\Http\Controllers\Frontend\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Frontend\Auth\SocialController;
use App\Http\Controllers\Frontend\Auth\UserTypeController;
use App\Http\Controllers\Frontend\Auth\VerifyEmailController;
use Illuminate\Support\Facades\Route;

Route::group([
    'namespace' => 'Auth',
    'prefix' => 'auth',
    'as' => 'auth.',
], function () {
    Route::get('/register/role', [UserTypeController::class, 'index'])
        ->middleware('auth')
        ->name('role.index');

    Route::post('/register/role', [UserTypeController::class, 'store'])
        ->middleware('auth')
        ->name('role.store');

    Route::get('/register/{role?}', [RegisteredUserController::class, 'create'])
        ->middleware('guest')
        ->name('register');

    Route::post('/register/{role?}', [RegisteredUserController::class, 'store'])
        ->middleware('guest')
        ->name('register.store');

    Route::get('/login', [AuthenticatedSessionController::class, 'create'])
        ->middleware('guest')
        ->name('login');

    Route::post('/login', [AuthenticatedSessionController::class, 'store'])
        ->middleware('guest')
        ->name('login.store');

    Route::get('/forgot-password', [PasswordResetLinkController::class, 'create'])
        ->middleware('guest')
        ->name('password.request');

    Route::post('/forgot-password', [PasswordResetLinkController::class, 'store'])
        ->middleware('guest')
        ->name('password.email');

    Route::get('/reset-password/{token}', [NewPasswordController::class, 'create'])
        ->middleware('guest')
        ->name('password.reset');

    Route::post('/reset-password', [NewPasswordController::class, 'store'])
        ->middleware('guest')
        ->name('password.update');

    Route::get('/verify-email', [EmailVerificationPromptController::class, '__invoke'])
        ->middleware('auth')
        ->name('verification.notice');

    Route::get('/verify-email/{id}/{hash}', [VerifyEmailController::class, '__invoke'])
        ->middleware(['signed', 'throttle:6,1'])
        ->name('verification.verify');

    Route::post('/email/verification-notification', [EmailVerificationNotificationController::class, 'store'])
        ->middleware(['auth', 'throttle:6,1'])
        ->name('verification.send');

    Route::get('/confirm-password', [ConfirmablePasswordController::class, 'show'])
        ->middleware('auth')
        ->name('password.confirm');

    Route::post('/confirm-password', [ConfirmablePasswordController::class, 'store'])
        ->middleware('auth');

    Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])
        ->middleware('auth')
        ->name('logout');

    // Socialite Routes
    Route::get('login/{provider}', [SocialController::class, 'redirect'])
        ->middleware('guest')
        ->name('social.login');

    Route::get('login/google/test', [SocialController::class, 'test'])
        ->middleware('guest')
        ->name('social.test');

    Route::get('login/{provider}/callback', [SocialController::class, 'callback'])
        ->middleware('guest')
        ->name('social.callback');


});
