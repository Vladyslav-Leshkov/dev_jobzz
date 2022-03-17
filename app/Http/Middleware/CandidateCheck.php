<?php

namespace App\Http\Middleware;

use App\Models\Auth\User;
use Closure;
use Illuminate\Http\Request;

class CandidateCheck
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

        if (!$user || (!$user->isCandidate() && !$user->isAdmin())) {
            abort(403, __('Access Denied'));
        }

        return $next($request);
    }
}
