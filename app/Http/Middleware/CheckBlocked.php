<?php

namespace App\Http\Middleware;

use App\Models\Auth\User;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CheckBlocked
{
    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param Closure $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        /**
         * @var User $user
         */
        $user = $request->user();
        if ($user && !$user->isAdmin()) {
            $route_name = $request->route()->getName();
            if ($route_name !== null && !str_starts_with($route_name, 'frontend.set-locale') && !str_starts_with($route_name, 'frontend.tinkoff')) {
                if ($user->status === User::STATUS_BLOCKED) {
                    if ($user->isCandidate()) {
                        Auth::guard('web')->logout();
                        $request->session()->invalidate();
                        return redirect()->route('frontend.auth.login')->withFlashDanger(__('Your account has been blocked by the administrator'));
                    }

                    if ($user->isRecruiter() && !str_starts_with($route_name, 'frontend.auth.')
                        && !str_starts_with($route_name, 'frontend.profile.payment')
                        && !str_starts_with($route_name, 'frontend.profile.blocked')
                        && !str_starts_with($route_name, 'frontend.messenger')
                    ) {
                        return redirect()->route('frontend.profile.blocked');
                    }
                }
            }

        }

        return $next($request);
    }
}
