<?php

namespace App\Http\Livewire\Backend;

use App\Models\Auth\User;
use App\Models\Job\Payout;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filter;

/**
 * Class UsersPayoutsTable.
 */
class UsersPayoutsTable extends DataTableComponent
{
    public string $defaultSortColumn = 'created_at';

    public string $defaultSortDirection = 'desc';

    public ?int $searchFilterDebounce = 300;

    public ?bool $searchFilterDefer = true;

    /**
     * @var User
     */
    public $user;

    /**
     * @var array
     */
    protected $options = [
        'bootstrap.container' => false,
        'bootstrap.classes.table' => 'table table-striped table-responsive',
    ];

    /**
     * @param User $user
     */
    public function mount(User $user): void
    {
        $this->user = $user;
    }

    /**
     * @return Builder
     */
    public function query(): Builder
    {
        $query = Payout::where('recruiter_id', $this->user->id)->with(['candidate', 'vacancy'])
            ->when($this->getFilter('status'), fn($query, $status) => $query->where('status', $status));

        return $query;
    }

    /**
     * @return array
     */
    public function columns(): array
    {
        return [
            Column::make(__('#'), 'id')
                ->searchable()
                ->sortable(),

            Column::make('Кандидат', 'name')
                ->format(function ($value, $column, $row) {
                    return $row->candidate->name;
                }),

            Column::make(__('Vacancy'), 'vacancy')
                ->format(function ($value, $column, $row) {
                    return $row->vacancy->title;
                }),

            Column::make('Дата выхода', 'released_to_work')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return $row->released_to_work->format('d.m.Y');
                }),

            Column::make('Оплата до', 'pay_before')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    $class = $row->is_late ? 'text-danger' : '';

                    return "<span class='{$class}'>{$row->pay_before->format('d.m.Y')}</span>";
                })
                ->asHtml(),

            Column::make('К оплате', 'amount')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return to_currency($row->amount, $row->currency);
                }),

            Column::make(__('Status'), 'status')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return view('backend.recruiter.includes.payout-status', ['model' => $row]);
                }),

            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.recruiter.includes.payout-actions', ['model' => $row]);
                }),
        ];
    }

    public function filters(): array
    {
        return [
            'status' => Filter::make('Статус')
                ->select([
                    '' => 'Any',
                    Payout::STATUS_NEW => 'New',
                    Payout::STATUS_PAID => 'Payed',
                    Payout::STATUS_REJECTED => 'Rejected',
                ]),

        ];
    }

    public function extendPayBefore($id)
    {
        $payout = Payout::find($id);
        $payout->pay_before = $payout->pay_before->lte(Carbon::now())
            ? Carbon::now()->addDays(3)->endOfDay() : $payout->pay_before->addDays(3)->endOfDay();
        $payout->save();
    }

    public function confirmPayout($id)
    {
        $payout = Payout::find($id);
        if ($payout) {
            $payout->status = Payout::STATUS_PAID;
            $payout->save();

            /*
             * Обновляем счетчик наймов
             */
            $this->user->hires = $this->user->payed_payouts()->count();
            $this->user->timestamps = false;
            $this->user->save();
        }
    }

    public function rejectPayout($id)
    {
        $payout = Payout::find($id);
        if ($payout) {
            $payout->status = Payout::STATUS_REJECTED;
            $payout->save();
        }
    }
}
