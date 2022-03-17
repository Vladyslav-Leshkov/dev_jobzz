<?php

namespace App\Lib\Tinkoff\EInvoice;

use JsonSerializable;
use stdClass;

class EInvoice implements JsonSerializable
{
    public string $orderId;

    public int $amount;

    public string $endDate;

    public Description $description;

    public string $redirectUrl;

    public Shop $shop;

    public function jsonSerialize()
    {
        $obj = new stdClass();
        $obj->orderId = $this->orderId;
        $obj->amount = $this->amount;
        $obj->endDate = $this->endDate;
        $obj->description = $this->description;
        $obj->redirectUrl = $this->redirectUrl;

        if (!is_null($this->shop ?? null)) {
            $obj->shop = $this->shop;
        }

        return $obj;
    }
}
