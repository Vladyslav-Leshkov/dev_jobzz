<?php

namespace App\Lib\Tinkoff;

use App\Lib\Tinkoff\Core\Service;
use Illuminate\Support\Carbon;
use Topvisor\TinkoffSdk\Business\ErrorThrower;
use Topvisor\TinkoffSdk\Business\Invoice;
use Topvisor\TinkoffSdk\Business\InvoicePdf;
use Topvisor\TinkoffSdk\Business\InvoicePdfParser;
use Topvisor\TinkoffSdk\Core\Http\Client;
use Topvisor\TinkoffSdk\Core\Http\Request;
use Topvisor\TinkoffSdk\Core\JsonParser;
use Topvisor\TinkoffSdk\Core\ParsersChain;

use Topvisor\TinkoffSdk\Id\AuthToken;
use Topvisor\TinkoffSdk\Id\Session;

class InvoiceService
{
    private const URL = '/api/v1/invoice/send';
    private const ADD_METHOD = 'POST';
    private const ADD_HEADERS = ['Content-Type' => ['application/json']];

    private Service $service;

    public function __construct()
    {
        $this->service = new Service();
    }

    public function __destruct()
    {
        unset($this->service);
    }

    public function add(Invoice $invoice, ?Client $http = null): InvoicePdf
    {
        $req = new Request($this->url());
        $req->headers->valuesByName = self::ADD_HEADERS;
        $req->method = self::ADD_METHOD;
        $req->body = json_encode($invoice);
        $resp = $this->service->send($req, $http);
        $parser = new ParsersChain(JsonParser::instance(), InvoicePdfParser::instance());

        return $parser->parse($resp->body);
    }

    public function url()
    {
        $url = Service::ENDPOINT_BUSINESS;
        if (config('services.tinkoff.sandbox')) {
            $url .= '/sandbox';
        }
        $url .= self::URL;

        return $url;
    }
}
