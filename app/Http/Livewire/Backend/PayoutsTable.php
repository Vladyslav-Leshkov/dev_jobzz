<?php

namespace App\Http\Livewire\Backend;

use App\Models\Job\Payout;
use App\Services\Frontend\Job\PayoutService;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Storage;
use Livewire\TemporaryUploadedFile;
use Livewire\WithFileUploads;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filter;

class PayoutsTable extends DataTableComponent
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
        $query = Payout::query()
            ->with('invoice')
            ->with('candidate', function ($q) {
                return $q->withTrashed();
            })
            ->with('recruiter', function ($q) {
                return $q->withTrashed();
            })
            ->with('vacancy', function ($q) {
                return $q->withTrashed();
            })
            ->leftJoin('users as candidates', 'candidates.id', '=', 'payouts.candidate_id')
            ->leftJoin('users as recruiters', 'recruiters.id', '=', 'payouts.recruiter_id')
            ->selectRaw('payouts.*, 
            candidates.id as candidate_id, 
            candidates.first_name as candidate_first_name, 
            candidates.last_name as candidate_last_name, 
            recruiters.id as recruiter_id, 
            recruiters.first_name as recruiter_first_name, 
            recruiters.last_name as recruiter_last_name')
            ->when($statusFilter !== null, function ($query, $status) use ($statusFilter) {
                if ((int)$statusFilter === Payout::STATUS_EXPIRED) {
                    return $query->where(function ($sq) {
                        return $sq->where('payouts.status', Payout::STATUS_PENDING)->whereDate('payouts.pay_before', '<=', Carbon::now()->endOfDay());
                    })->orWhere('payouts.status', Payout::STATUS_EXPIRED);
                } elseif ((int)$statusFilter === Payout::STATUS_PENDING) {
                    return $query->where('payouts.status', Payout::STATUS_PENDING)->whereDate('payouts.pay_before', '>', Carbon::now()->endOfDay());
                } else {
                    return $query->where('payouts.status', (int)$statusFilter);
                }

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

//            Column::make(__('#'), 'invoice_no')
//                ->searchable()
//                ->sortable()
//                ->format(function ($value, $column, $row) {
//                    return "<span class='text-nowrap'>{$row->invoice_no}</span>";
//                })
//                ->asHtml(),
            Column::make(__('Recruiter'), 'recruiter_last_name')
                ->searchable(function (Builder $query, $searchTerm) {
                    $query->orWhereRaw("CONCAT_WS(' ', recruiters.id, recruiters.last_name, recruiters.first_name) LIKE '%$searchTerm%'");
                })
                ->format(function ($value, $column, $row) {
                    return view('backend.recruiter.includes.info', ['model' => (object)$row->recruiter_info]);
                })
                ->sortable()
                ->asHtml(),

            Column::make(__('candidate.title'), 'candidate_last_name')
                ->searchable(function (Builder $query, $searchTerm) {
                    $query->orWhereRaw("CONCAT_WS(' ', candidates.id, candidates.last_name, candidates.first_name) LIKE '%$searchTerm%'");
                })
                ->format(function ($value, $column, $row) {
                    return view('backend.candidate.includes.info', ['model' => (object)$row->candidate_info]);
                })
                ->sortable()
                ->asHtml(),


            Column::make('Сумма', 'amount')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    $amount = to_currency($row->amount, $row->currency);

                    return "<span class='text-nowrap'>{$amount}</span>";
                })
                ->asHtml(),

            Column::make(__('Status'), 'status')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return view('backend.invoice.includes.payout-status', ['model' => $row]);
                }),

            Column::make(__('Дата создания'), 'created_at')
                ->format(function ($value, $column, $row) {
                    return $row->created_at ? $row->created_at->format('d.m.Y H:i') : '';
                })
                ->sortable(),

            Column::make(__('Оплатить до'))
                ->format(function ($value, $column, $row) {
                    $text = $row->pay_before ? $row->pay_before->format('d.m.Y') : '';
                    $class = ($row->status == Payout::STATUS_NEW || $row->status == Payout::STATUS_PENDING) && $row->pay_before->lte(Carbon::now()->endOfDay())
                        ? 'text-danger' : '';
                    return "<span class='{$class}'>{$text}</span>";
                })
                ->asHtml(),

            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.invoice.includes.payout-actions', ['model' => $row, 'act_file' => $this->act_file, 'current_id' => $this->current_id]);
                }),
        ];
    }

    public function filters(): array
    {
        return [
            'status' => Filter::make('Статус')
                ->select([
                    '' => 'Любой',
                    Payout::STATUS_NEW => 'Новый',
                    Payout::STATUS_PAID => 'Оплачен',
                    Payout::STATUS_REJECTED => 'Отменен',
                    Payout::STATUS_PENDING => 'Ожидание',
                    Payout::STATUS_EXPIRED => 'Просрочен',
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
        $payout = Payout::find($id);
        if ($payout) {
            switch ((int)$status) {
                case Payout::STATUS_PAID:
                    PayoutService::markPayed($payout);
                    break;
                case Payout::STATUS_REJECTED:
                    PayoutService::markRejected($payout);
                    break;
                default:
                    $payout->status = $status;
                    $payout->save();
                    break;
            }

        }
    }

    public function uploadAct()
    {
        $this->validate([
            'act_file' => 'file|mimes:pdf,doc,docx|max:1024', // 1MB Max
        ]);

        $payout = Payout::find($this->current_id);

        if ($payout) {
            $path = $this->act_file->storePublicly('userfiles/' . $payout->recruiter_id . '/');
            $payout->act = $path;
            $payout->save();
        }
        $this->current_id = 0;
        $this->act_file = null;
    }

    public function clearAct($id)
    {
        $payout = Payout::find($id);
        if ($payout) {
            if (!empty($payout->act) && Storage::exists($payout->act)) {
                Storage::delete($payout->act);
            }
            $payout->act = '';
            $payout->save();
        }
        $this->current_id = 0;
        $this->act_file = null;
    }
}

