<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;

class LastActivityUser
{

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     *
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (!Auth::guest() && $request->user()->last_activity < Carbon::now()->subMinutes(5)->format('Y-m-d H:i:s')) {
            $user = $request->user();
            $user->last_activity = new \DateTime;
            $user->timestamps = false;
            $user->save();
        }

        return $next($request);
    }
}
