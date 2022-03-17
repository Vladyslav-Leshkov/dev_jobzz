<?php

namespace App\Http\Controllers\Frontend\Profile;

use App\Http\Controllers\Controller;
use App\Http\Middleware\RecruiterCheck;
use App\Http\Requests\OrderInvoiceRequest;
use App\Http\Requests\TinkoffNotifyRequest;
use App\Models\Job\Currency;
use App\Models\Job\Invoice;
use App\Models\Job\PaymentMethod;
use App\Models\Job\Payout;
use App\Models\Location\Country;
use App\Services\Frontend\Job\InvoiceService;
use App\Services\TinkoffService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use PDF;

class PaymentController extends Controller
{
    //
    public function __construct()
    {
        $this->middleware(RecruiterCheck::class)->except(['paymentNotify']);
    }

    public function index()
    {
        $recruiter = current_user();

        $pending_items = $recruiter->payouts()->with(['candidate'])
            ->whereIn('status', [Payout::STATUS_NEW, Payout::STATUS_PENDING])
            ->orderBy('created_at', 'desc')->get();

        $archive_items = $recruiter->payouts()->with(['candidate', 'invoice'])
            ->whereIn('status', [Payout::STATUS_PAID])
            ->orderBy('created_at', 'desc')->get();

        return view('frontend.profile.payment.index', [
            'pending_items' => $pending_items,
            'archive_items' => $archive_items,
        ]);
    }

    public function create(Request $request)
    {
        $cart_items = $request->input('items', []);
        if (count($cart_items) === 0) {
            return redirect()->route('frontend.profile.payment.index')->withFlashDanger('Необходимо выбрать кандидатов');
        }
        session()->put('cart_items', $cart_items);

        return redirect()->route('frontend.profile.payment.invoice');
    }

    public function invoice()
    {
        $recruiter = current_user();
        $cart_items = session()->get('cart_items', []);
        if (count($cart_items) === 0) {
            return redirect()->route('frontend.profile.payment.index')->withFlashDanger('Необходимо выбрать кандидатов');
        }
        $items = $recruiter->payouts()->with(['candidate'])->whereIn('id', $cart_items)->get();

        $options = [
            'payment_methods' => PaymentMethod::all(),
            'currencies' => Currency::all(),
            'countries' => Country::all(),
        ];

        $card_address = $recruiter->getCardAddress();
        $swift_address = $recruiter->getSwiftAddress();
        $invoice_address = $recruiter->getInvoiceAddress();

        return view('frontend.profile.payment.invoice', [
            'items' => $items,
            'options' => $options,
            'recruiter' => $recruiter,
            'card_address' => $card_address,
            'swift_address' => $swift_address,
            'invoice_address' => $invoice_address,
        ]);
    }

    public function order(OrderInvoiceRequest $request)
    {
        $invoice = InvoiceService::createInvoice($request->validated());

        switch ($invoice->payment_method) {
            case 'invoice':
                $pdf = TinkoffService::createInvoice($invoice);
                if ($pdf === false) {
                    $invoice->invoice = route('frontend.profile.payment.download', $invoice);
                    $invoice->save();
                }
                break;
            case 'swift':
                $invoice->invoice = route('frontend.profile.payment.download', $invoice);
                $invoice->save();

                break;
            case 'card':
                $redirectUrl = TinkoffService::createAcquiringPayment($invoice);
                if ($redirectUrl !== false) {
                    return redirect($redirectUrl->paymentUrl);
                }
                return back()->withFlashDanger(__('An error occurred while making a payment. Please try later or another way.'));

        }

        return redirect()->route('frontend.profile.payment.success', $invoice);
    }

    public function success(Invoice $invoice)
    {
        Gate::authorize('owner-invoice', $invoice);


        return view('frontend.profile.payment.success', ['invoice' => $invoice]);
    }


    public function download(Invoice $invoice)
    {
        Gate::authorize('owner-invoice', $invoice);
        $pdf = PDF::loadView('frontend.profile.invoice.' . $invoice->payment_method . '-template', ['invoice' => $invoice]);

        return $pdf->download('invoice-' . $invoice->invoice_no . '.pdf');
    }

    public function downloadAct(Payout $payout)
    {
        Gate::authorize('owner-payout', $payout);

        return Storage::download($payout->act, 'act-' . $payout->invoice_no . '.' . pathinfo($payout->act, PATHINFO_EXTENSION));
    }

    public function paymentSuccess(Request $request)
    {
        Log::info('Payment Success', $request->all());

        if (!empty($request->OrderId)) {
            $invoice = Invoice::where('invoice_no', $request->OrderId)->firstOrFail();
            TinkoffService::checkAcquiringPayment($invoice);
        }


        return view('frontend.profile.payment.payment-success');
    }

    public function paymentFail(Request $request)
    {
        Log::info('Payment Fail', $request->all());
        $message = $request->Message ?? '';
        return view('frontend.profile.payment.payment-fail', ['message' => $message]);
    }


    public function paymentNotify(Request $request)
    {

        if (!empty($request->OrderId)) {
            $invoice = Invoice::where('invoice_no', $request->OrderId)->firstOrFail();
            if ($request->Status === 'CONFIRMED') {
                InvoiceService::markPayed($invoice);
            }
            if ($request->Status === 'REJECTED') {
                $invoice->status = Invoice::STATUS_REJECTED;
                $invoice->save();
            }
            return response('OK');
        }
        Log::error('Payment Notify', $request->all());
        return response('ERROR');
    }
}
