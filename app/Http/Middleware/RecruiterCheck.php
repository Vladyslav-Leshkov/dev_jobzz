<?php

namespace App\Http\Middleware;

use App\Models\Auth\User;
use Closure;
use Illuminate\Http\Request;

class RecruiterCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
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
        if ($route_name && !str_starts_with($route_name, 'frontend.tinkoff')) {
            if (!$user || (!$user->isRecruiter() && !$user->isAdmin())) {
                abort(403, __('Access Denied'));
            }
        }
        return $next($request);
    }
}
