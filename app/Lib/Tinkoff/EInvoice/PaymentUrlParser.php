<?php

namespace App\Lib\Tinkoff\EInvoice;

use Topvisor\TinkoffSdk\Core\Parser;

class PaymentUrlParser implements Parser
{
    private static ?self $instance = null;

    private function __construct()
    {
    }

    public static function instance(): self
    {
        if (!self::$instance) {
            self::$instance = new self();
        }

        return self::$instance;
    }

    public function parse($raw)
    {
        $invoicePdf = new PaymentUrl();
        if (isset($raw->id)) {
            $invoicePdf->id = $raw->id;
        }
        if (isset($raw->paymentUrl)) {
            $invoicePdf->paymentUrl = $raw->paymentUrl;
        }

        return $invoicePdf;
    }
}
