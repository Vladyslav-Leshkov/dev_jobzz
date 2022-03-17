<?php


use App\Http\Controllers\Backend\Invoice\InvoiceController;

Route::group([
    'prefix' => 'invoice',
    'as' => 'invoice.',
], function () {
    Route::get('', [InvoiceController::class, 'index'])->name('index');
    Route::get('{payout}', [InvoiceController::class, 'show'])->name('show');
    Route::get('{payout}/download', [InvoiceController::class, 'download'])->name('download');
    Route::get('{payout}/download-act', [InvoiceController::class, 'downloadAct'])->name('download-act');
});
