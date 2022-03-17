<?php

namespace App\Lib\Tinkoff\Core;

use Topvisor\TinkoffSdk\Core\Http\Request;
use Topvisor\TinkoffSdk\Core\Http\Response;

class Client implements \Topvisor\TinkoffSdk\Core\Http\Client
{
    public function send(Request $req): Response
    {
        // TODO: Implement send() method.
        return new Response();
    }
}
