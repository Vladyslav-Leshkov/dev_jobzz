<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Http\Controllers\Controller;
use App\Models\Auth\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Verified;
use App\Http\Requests\Auth\EmailVerificationRequest;
use Illuminate\Http\RedirectResponse;

class VerifyEmailController extends Controller
{
    /**
     * Mark the authenticated user's email address as verified.
     *
     * @param EmailVerificationRequest $request
     *
     * @return RedirectResponse
     */
    public function __invoke(EmailVerificationRequest $request, $id)
    {
        $user = User::findOrFail($id);

        if ($user && $user->hasVerifiedEmail()) {
            return redirect()->intended(RouteServiceProvider::HOME . '?verified=1')->withFlashSuccess(__('Thank you for verifying your e-mail address.'));
        }

        if ($user && $user->markEmailAsVerified()) {
            event(new Verified($user));
        }

        return redirect()->intended(RouteServiceProvider::HOME . '?verified=1')->withFlashSuccess(__('Thank you for verifying your e-mail address.'));
    }
}
