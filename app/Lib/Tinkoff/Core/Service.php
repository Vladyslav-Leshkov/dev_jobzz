<?php

namespace App\Lib\Tinkoff\Core;

use Illuminate\Support\Carbon;
use Topvisor\TinkoffSdk\Business\ErrorThrower;
use Topvisor\TinkoffSdk\Core\Http\Client;
use Topvisor\TinkoffSdk\Core\Http\Curl;
use Topvisor\TinkoffSdk\Core\Http\Request;
use Topvisor\TinkoffSdk\Core\Http\Response;
use Topvisor\TinkoffSdk\Core\Middleware;
use Topvisor\TinkoffSdk\Id\AuthToken;
use Topvisor\TinkoffSdk\Id\Session;

class Service
{
    public const ENDPOINT_ID = 'https://id.tinkoff.ru';
    public const ENDPOINT_BUSINESS = 'https://business.tinkoff.ru/openapi';
    public const ENDPOINT_SECURED_BUSINESS = 'https://secured-openapi.business.tinkoff.ru';

    public const HEADER_NAME_REQUEST_ID = 'X-Request-Id';

    private array $middlewares = [];

    public function __construct()
    {
        $expired = Carbon::now()->addMinutes(20)->getTimestamp();
        if (config('services.tinkoff.sandbox')) {
            $token = 'TinkoffOpenApiSandboxSecretToken';
        } else {
            $token = config('services.tinkoff.token');
        }
        $authToken = new AuthToken($token, $expired);
        $session = new Session($authToken); // используется для дальнейших запросов к api
        $this->addMiddleware($session);
        $this->addMiddleware(new ErrorThrower());
    }

    public function addMiddleware(Middleware $middleware)
    {
        $this->middlewares[] = $middleware;
    }

    public function __destruct()
    {
        for ($i = 0; $i < count($this->middlewares); $i++) {
            unset($this->middlewares[$i]);
        }
    }

    public function send(Request $req, ?Client $http = null): Response
    {
        $http = $http ?? new Curl();

        foreach ($this->middlewares as $middleware) {
            $middleware->onRequest($req);
        }

        $resp = $http->send($req);

        foreach (array_reverse($this->middlewares) as $middleware) {
            $middleware->onResponse($resp);
        }

        return $resp;
    }
}
