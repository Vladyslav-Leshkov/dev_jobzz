<?php

namespace App\Http\Middleware;

use App\Models\Auth\User;
use Closure;
use Illuminate\Http\Request;

class CheckEmailVerification
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        /**
         * @var User $user
         */
        $user = $request->user();
        $route_name = $request->route()->getName();

        if (!empty($user) && !empty($route_name) &&
            !$user->isMasterAdmin() &&
            !str_starts_with($route_name, 'frontend.auth.') &&
            !str_starts_with($route_name, 'frontend.profile.index') &&
            !str_starts_with($route_name, 'frontend.profile.contact') &&
            !str_starts_with($route_name, 'frontend.tinkoff') &&
            !$user->hasVerifiedEmail()) {
            return redirect()->route('frontend.auth.verification.notice')->withFlashInfo(__('Verify Your E-mail Address'));
        }
        return $next($request);
    }
}
