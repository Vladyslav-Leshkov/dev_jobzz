<?php

namespace App\Services;

use App\Lib\Tinkoff\Acquiring\AcquiringPayment;
use App\Lib\Tinkoff\EInvoice\Description;
use App\Lib\Tinkoff\EInvoice\EInvoice;
use App\Lib\Tinkoff\EInvoice\Shop;
use App\Lib\Tinkoff\MerchantService;
use App\Models\Job\Invoice;
use App\Models\Job\Payout;
use App\Services\Frontend\Job\InvoiceService;
use Exception;
use Illuminate\Support\Facades\Log;
use Topvisor\TinkoffSdk\Business\Invoice as TinkoffInvoice;
use Topvisor\TinkoffSdk\Business\InvoiceItem;
use Topvisor\TinkoffSdk\Business\InvoicePayer;
use App\Lib\Tinkoff\InvoiceService as TinkoffInvoiceService;

class TinkoffService
{
    public static function createInvoice(Invoice $invoice)
    {
        $payer_info = $invoice->payment_info['payer'];
        $payer = new InvoicePayer();

        $payer->inn = (int)$payer_info['inn'];
        $payer->name = $payer_info['name'];

        $invoiceItems = [];

        /**
         * @var Payout $item
         */
        foreach ($invoice->payouts as $item) {
            $invoiceItem = new InvoiceItem();
            $invoiceItem->name = __('Services in the area of personnel search and selection');
            $invoiceItem->price = $item->amount;
            $invoiceItem->unit = ' ';
            $invoiceItem->vat = 'None';
            $invoiceItem->amount = 1;
            $invoiceItems[] = $invoiceItem;
        }

        $invoice_no = str_replace('-', '', $invoice->invoice_no);
        $tinkoffInvoice = new TinkoffInvoice();
        $tinkoffInvoice->payer = $payer;
        $tinkoffInvoice->invoiceNumber = $invoice_no;
        $tinkoffInvoice->items = $invoiceItems;

        $invoiceService = new TinkoffInvoiceService();

        try {
            $invoicePdf = $invoiceService->add($tinkoffInvoice);
            if ($invoicePdf) {
                $invoice->invoice = $invoicePdf->pdfUrl;
                $invoice->tinkoff_no = $invoice_no;
                $invoice->save();
            }

            return $invoicePdf;
        } catch (Exception $exception) {
            Log::error($exception->getMessage());

            return false;
        }
    }

    public static function createEInvoice(Invoice $invoice)
    {
        $tinkoffInvoice = new EInvoice();
        $tinkoffInvoice->orderId = $invoice->invoice_no;
        $tinkoffInvoice->amount = $invoice->amount;
        $tinkoffInvoice->endDate = $invoice->created_at->addDays(3)->toW3cString();
        $description = new Description();
        $description->short = 'Услуги в сфере поиска и подбора персонала #' . $invoice->invoice_no;
        $description->full = 'Оплата услуг в сфере поиска и подбора персонала #' . $invoice->invoice_no;
        $tinkoffInvoice->description = $description;
        $tinkoffInvoice->redirectUrl = route('frontend.profile.payment.success', $invoice);

        if (!empty(config('services.tinkoff.terminal'))) {
            $shop = new Shop();
            $shop->id = config('services.tinkoff.terminal');
            $shop->name = 'Jobzz';
            $tinkoffInvoice->shop = $shop;
        }


        $merchantService = new MerchantService();

        try {
            $redirectUrl = $merchantService->create($tinkoffInvoice);
            if ($redirectUrl) {
                $invoice->tinkoff_no = $redirectUrl->id;
                $invoice->save();
            }

            return $redirectUrl;
        } catch (Exception $exception) {
            Log::error($exception->getMessage());

            return false;
        }
    }

    public static function createAcquiringPayment(Invoice $invoice)
    {
        $acquiring = new AcquiringPayment();
        $payer_info = $invoice->payment_info['payer'];

        //подготовка массива с покупками
        $items = [];
        $candidate_ids = [];
        foreach ($invoice->payment_info['items'] as $item) {
            $candidate_ids[] = $item['candidate_id'];
            $items[] = [
                'Name' => site_option('invoice_offer_rub') . ' #' . $item['candidate_id'] ?? 0,
                'Amount' => $item['amount'],    //цена товара в рублях
                'Price' => $item['amount'],    //цена товара в рублях
                'Quantity' => 1,    //цена товара в копейках
                'Tax' => 'none',  //НДС
            ];
        }


        //Подготовка массива с данными об оплате
        $payment = [
            'OrderId' => $invoice->invoice_no,        //Ваш идентификатор платежа
            'Amount' => $invoice->amount,           //сумма всего платежа в рублях
            'Language' => app()->getLocale(),            //язык - используется для локализации страницы оплаты
            'Description' => __('Services in the area of personnel search and selection') . ' #' . implode(', #', $candidate_ids),   //описание платежа
            'Email' => $payer_info['email'] ?? '',//email покупателя
            'Phone' => $payer_info['phone'] ?? '',   //телефон покупателя
            'Name' => $payer_info['name'] ?? '', //Имя покупателя
            'Taxation' => 'usn_income',     //Налогооблажение
            'NotificationURL' => url(route('frontend.tinkoff.payment-notify')),     //NotificationURL
            'SuccessURL' => url(route('frontend.profile.payment.payment-success')),     //SuccessURL
            'FailURL' => url(route('frontend.profile.payment.payment-fail')),     //FailURL
        ];


        //Получение url для оплаты
        $redirectUrl = $acquiring->paymentURL($payment, $items);

        //Контроль ошибок
        if ($redirectUrl === false) {
            Log::error($acquiring->error);
            return false;
        } else {
            $invoice->tinkoff_no = $redirectUrl->id;
            $invoice->save();
            return $redirectUrl;
        }
    }


    public static function checkAcquiringPayment(Invoice $invoice)
    {
        if (!empty($invoice->tinkoff_no)) {
            $acquiring = new AcquiringPayment();
            $state = $acquiring->getState($invoice->tinkoff_no);
            //Контроль ошибок
            if ($state === false) {
                Log::error($acquiring->error);
                return false;
            } else {
                if ($state === 'CONFIRMED') {
                    InvoiceService::markPayed($invoice);
                }
                if ($state === 'REJECTED') {
                    $invoice->status = Invoice::STATUS_REJECTED;
                    $invoice->save();
                }
                return $state;
            }
        }
        return false;
    }

}
