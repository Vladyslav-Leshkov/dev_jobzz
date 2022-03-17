<?php

namespace App\Http\Middleware;

use App\Models\Auth\User;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class ProfileFilled
{
    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param Closure $next
     *
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        /**
         * @var User $user
         */
        $user = $request->user();
        $route_name = $request->route()->getName();

        if (!empty($route_name) &&
            !str_starts_with($route_name, 'frontend.set-locale') &&
            !str_starts_with($route_name, 'frontend.auth.') &&
            !str_starts_with($route_name, 'frontend.tinkoff') &&
            ($user && !$user->isAdmin() && !$user->isSupport())) {

            if ($user->status === User::STATUS_INACTIVE &&
                !($user->isCandidate() && str_starts_with($route_name, 'frontend.candidate.')) &&
                !str_starts_with($route_name, 'frontend.profile.wizard.') &&
                !str_starts_with($route_name, 'frontend.profile.preview')
            ) {
                if (empty($user->type)) {
                    return redirect()->route('frontend.auth.role.index');
                }

                //$message = $user->isRecruiter() && $user->agree === 0 ? '' : __('Please fill in your profile.');
                Log::info('profile wizard');
                return redirect()->route('frontend.profile.wizard.index'); //->withFlashInfo($message);
            }
        }

        return $next($request);
    }
}
