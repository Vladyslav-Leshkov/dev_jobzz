<?php

namespace App\Http\Livewire\Backend;

use App\Models\Job\Invoice;
use App\Models\Job\Payout;
use App\Services\Frontend\Job\InvoiceService;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Storage;
use Livewire\TemporaryUploadedFile;
use Livewire\WithFileUploads;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filter;

/**
 * Class UsersTable.
 */
class InvoicesTable extends DataTableComponent
{
    use WithFileUploads;

    public string $defaultSortColumn = 'id';

    public string $defaultSortDirection = 'desc';

    public bool $singleColumnSorting = true;

    public ?int $searchFilterDebounce = 300;

    public ?bool $searchFilterDefer = true;

    /**
     * @var TemporaryUploadedFile
     */
    public $act_file;

    /**
     * @var int
     */
    public $current_id = 0;

    /**
     * @var string
     */
    public $status;

    /**
     * @var array
     */
    protected $options = [
        'bootstrap.container' => false,
        'bootstrap.classes.table' => 'table table-striped table-responsive',
    ];

    /**
     * @param string $status
     */
    public function mount(string $status = 'active'): void
    {
        $this->status = $status;
    }

    /**
     * @return Builder
     */
    public function query(): Builder
    {
        $statusFilter = $this->getFilter('status');
        $query = Invoice::query()->leftJoin('users', 'users.id', '=', 'invoices.user_id')->with(['payouts', 'user'])
            ->selectRaw('invoices.*, users.first_name, users.last_name')
            ->when($statusFilter !== null, function ($query, $status) use ($statusFilter) {
                return $query->where('invoices.status', (int)$statusFilter);
            });

        return $query;
    }

    /**
     * @return array
     */
    public function columns(): array
    {
        return [
            Column::make(__('ID'), 'id')
                ->searchable()
                ->sortable(),

            Column::make(__('#'), 'invoice_no')
                ->searchable()
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return "<span class='text-nowrap'>{$row->invoice_no}</span>";
                })
                ->asHtml(),

            Column::make(__('User'), 'user.last_name')
                ->searchable(function (Builder $query, $searchTerm) {
                    $query->orWhereRaw("CONCAT_WS(' ', users.last_name, users.first_name) LIKE '%$searchTerm%'");
                })
                ->format(function ($value, $column, $row) {
                    return view('backend.recruiter.includes.info', ['model' => $row->user]);
                })
                ->sortable()
                ->asHtml(),

            Column::make(__('Способ оплаты'), 'payment_method')
                ->searchable()
                ->sortable(),

            Column::make('Сумма', 'invoices.amount')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    $amount = to_currency($row->amount, $row->currency);

                    return "<span class='text-nowrap'>{$amount}</span>";
                })
                ->asHtml(),

            Column::make(__('Status'), 'status')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return view('backend.invoice.includes.status', ['value' => $row->status]);
                }),

            Column::make(__('Дата создания'), 'created_at')
                ->format(function ($value, $column, $row) {
                    return $row->created_at ? $row->created_at->format('d.m.Y H:i') : '';
                })
                ->sortable(),

            Column::make(__('Оплатить до'))
                ->format(function ($value, $column, $row) {
                    $payout = $row->payouts->first();
                    $text = $payout && $payout->pay_before ? $payout->pay_before->format('d.m.Y') : '';
                    $class = $row->status == Invoice::STATUS_NEW && $payout && $payout->pay_before->lte(Carbon::now()->endOfDay())
                        ? 'text-danger' : '';
                    return "<span class='{$class}'>{$text}</span>";
                })
                ->asHtml(),

            Column::make(__('Дата оплаты'), 'paid_at')
                ->format(function ($value, $column, $row) {
                    return $row->paid_at ? $row->paid_at->format('d.m.Y H:i') : '';
                })
                ->sortable(),

            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.invoice.includes.actions', ['model' => $row, 'act_file' => $this->act_file, 'current_id' => $this->current_id]);
                }),
        ];
    }

    public function filters(): array
    {
        return [
            'status' => Filter::make('Статус')
                ->select([
                    '' => 'Любой',
                    Invoice::STATUS_NEW => 'Ожидает оплаты',
                    Invoice::STATUS_PAYED => 'Оплачен',
                    Invoice::STATUS_REJECTED => 'Отменен',
                    Invoice::STATUS_EXPIRED => 'Просрочен',
                ]),

        ];
    }

    public function currentId($id)
    {
        $this->current_id = $id;
        if ($id === 0) {
            $this->act_file = null;
        }
    }

    public function mark($id, $status)
    {
        $invoice = Invoice::find($id);
        if ($invoice) {
            $invoice->status = $status;

            if ((int)$status === Invoice::STATUS_PAYED) {
                InvoiceService::markPayed($invoice);
            }
            if ((int)$status === Invoice::STATUS_EXPIRED) {
                $invoice->payouts()->update(['status' => Payout::STATUS_NEW]);
            }
            if ((int)$status === Invoice::STATUS_REJECTED) {
                InvoiceService::markRejected($invoice);

            }
            if ((int)$status === Invoice::STATUS_NEW) {
                $invoice->payouts()->update(['status' => Payout::STATUS_PENDING]);
            }
            $invoice->save();
        }
    }

    public function uploadAct()
    {
        $this->validate([
            'act_file' => 'file|mimes:pdf,doc,docx|max:1024', // 1MB Max
        ]);

        $invoice = Invoice::find($this->current_id);

        if ($invoice) {
            $path = $this->act_file->storePublicly('userfiles/' . $invoice->user_id . '/');
            $invoice->act = $path;
            $invoice->save();
        }
        $this->current_id = 0;
        $this->act_file = null;
    }

    public function clearAct($id)
    {
        $invoice = Invoice::find($id);
        if ($invoice) {
            if (!empty($invoice->act) && Storage::exists($invoice->act)) {
                Storage::delete($invoice->act);
            }
            $invoice->act = '';
            $invoice->save();
        }
        $this->current_id = 0;
        $this->act_file = null;
    }
}
