<?php

namespace App\Http\Middleware;

use App\Models\Auth\User;
use Closure;

class AdminCheck
{
    /**
     * @param $request
     * @param  Closure  $next
     *
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        /**
         * @var User $user
         */
        $user = $request->user();

        if ($user && ($user->isAdmin() || $user->isSupport())) {
            return $next($request);
        }

        return redirect()->route('admin.login.create')->withFlashDanger(__('You do not have access to do that.'));
    }
}
