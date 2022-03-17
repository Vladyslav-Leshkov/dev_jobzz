<?php

namespace App\Http\Livewire\Backend;

use App\Models\Auth\User;
use App\Services\Backend\Auth\UserService;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filter;

/**
 * Class CandidatesTable.
 */
class CandidatesTable extends DataTableComponent
{
    public bool $singleColumnSorting = true;

    public array $sorts = [
        'id' => 'desc'
    ];

    public array $perPageAccepted = [20, 50, 100];

    public ?int $searchFilterDebounce = 300;

    public ?bool $searchFilterDefer = true;

    /**
     * @var int
     */
    public $deleteId = null;

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
     * @return Builder
     */
    public function query(): Builder
    {
        $statusFilter = $this->getFilter('status');
        $query = User::candidates()->with(['candidate_profile'])->withCount(['openDatas'])
            ->when($statusFilter !== null, function ($query, $status) use ($statusFilter) {
                return $query->where('status', (int)$statusFilter);
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

            Column::make(__('Name'), 'last_name')
                ->searchable(function (Builder $query, $searchTerm) {
                    $query->orWhereRaw("CONCAT_WS(' ', last_name, first_name) LIKE '%$searchTerm%'");
                })
                ->format(function ($value, $column, $row) {
                    return view('backend.candidate.includes.info', ['model' => $row]);
                })
                ->sortable()
                ->asHtml(),

            Column::make(__('E-mail'), 'email')
                ->searchable()
                ->sortable()
                ->format(function ($value) {
                    return '<a href="mailto:' . $value . '">' . $value . '</a>';
                })
                ->asHtml(),

            Column::make(__('Phone'), 'phone')
                ->searchable()
                ->sortable()
                ->format(function ($value) {
                    return '<a href="tel:' . clear_phone($value) . '">' . $value . '</a>';
                })
                ->asHtml(),

            Column::make(__('Last Activity'), 'last_activity')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return $row->last_activity ? $row->last_activity->timezone(config('app.correct_timezone'))->format('d.m.Y H:i') : '-';
                }),

            Column::make(__('Откр. конт.'), 'open_datas_count')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return view('backend.candidate.includes.open-contacts', ['model' => $row]);
                }),

            Column::make(__('Status'), 'status')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return view('backend.candidate.includes.status', ['value' => $value]);
                }),

            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.candidate.includes.actions', ['model' => $row]);
                }),
        ];
    }

    public function filters(): array
    {
        return [
            'status' => Filter::make('Статус')
                ->select([
                    '' => 'Любой',
                    User::STATUS_INACTIVE => 'Не активный',
                    User::STATUS_ACTIVE => 'Активный',
                    User::STATUS_BLOCKED => 'Заблочен',
                    User::STATUS_HIDDEN => 'Скрыт',
                    User::STATUS_MODERATE => 'На модерации',
                ]),

        ];
    }

    public function deleteId($id)
    {
        $this->deleteId = $id;
    }

    public function unlock($id)
    {
        $user = User::find($id);
        $user->status = User::STATUS_ACTIVE;
        $user->timestamps = false;
        $user->save();
    }

    public function lock($id)
    {
        $user = User::find($id);
        $user->status = User::STATUS_BLOCKED;
        $user->timestamps = false;
        $user->save();
    }

    public function hide($id)
    {
        $user = User::find($id);
        $user->status = User::STATUS_HIDDEN;
        $user->timestamps = false;
        $user->save();
    }

    public function delete()
    {
        $user = User::find($this->deleteId);
        if ($user) {
            resolve(UserService::class)->delete($user);
        }
    }
}
