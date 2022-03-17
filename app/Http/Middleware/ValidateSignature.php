<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Exceptions\InvalidSignatureException;

class ValidateSignature
{
    /**
     * Handle an incoming request.
     *
     * @param Request $request
     * @param Closure $next
     * @param string|null $relative
     * @return Response
     *
     * @throws InvalidSignatureException
     */
    public function handle($request, Closure $next, $relative = null)
    {
        if ($request->hasValidSignature($relative !== 'relative')) {
            return $next($request);
        }

        throw new InvalidSignatureException;
    }
}