<?php

namespace App\Http\Controllers\Backend\Invoice;

use App\Http\Controllers\Controller;
use App\Models\Job\Invoice;
use App\Models\Job\Payout;
use App\Services\Frontend\Job\InvoiceService;
use Illuminate\Support\Facades\Storage;
use PDF;

class InvoiceController extends Controller
{
    //
    public function index()
    {
        return view('backend.invoice.index');
    }

    public function show(Payout $payout)
    {
        return view('backend.invoice.show-payout', ['payout' => $payout]);
    }

    public function download(Payout $payout)
    {
        $invoice = $payout->invoice;
        if ($invoice === null) {
            abort(404, 'Счет не найден');
        }
        $method = $invoice && $invoice->payment_method === 'swift' ? 'swift' : 'invoice';
        $pdf = PDF::loadView('frontend.profile.invoice.' . $method . '-template', ['invoice' => $invoice]);

        return $pdf->download('invoice-' . $invoice->invoice_no . '.pdf');
    }

    public function downloadAct(Payout $payout)
    {
        return Storage::download($payout->act, 'act-' . $payout->id . '.' . pathinfo($payout->act, PATHINFO_EXTENSION));
    }
}
