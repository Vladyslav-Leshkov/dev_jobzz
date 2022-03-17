<?php

namespace App\Http\Livewire\Backend;

use App\Models\Auth\User;
use App\Services\Backend\Auth\UserService;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filter;

/**
 * Class UsersTable.
 */
class RecruitersTable extends DataTableComponent
{

    public bool $singleColumnSorting = true;

    public array $sorts = [
        'id' => 'desc'
    ];

    public array $perPageAccepted = [20, 50, 100];

    public ?int $searchFilterDebounce = 300;

    public ?bool $searchFilterDefer = true;

    //public ?bool $searchFilterLazy = true;

    /**
     * @var int
     */
    public $deleteId = 0;

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
        $query = User::recruiters()->with(['companies'])
            ->withCount(['vacancies', 'payed_payouts', 'to_pay_payouts', 'danger_payouts'])
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
                    $query->orWhereRaw("CONCAT_WS(' ', last_name, first_name) LIKE '%$searchTerm%'")
                        ->orWhereHas('companies', fn($q) => $q->where('title', 'LIKE', "%$searchTerm%"));
                })
                ->format(function ($value, $column, $row) {
                    return view('backend.recruiter.includes.info', ['model' => $row]);
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

            Column::make(__('Vacancies'), 'vacancies_count')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return '<a class="badge bg-info" href="' . route('admin.recruiter.vacancy.index', $row) . '">' . $value . '</a>';
                })
                ->asHtml(),
            Column::make('Наймов', 'hires')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return '<span class="badge bg-success">' . $value . '</span>';
                })
                ->asHtml(),

            Column::make('К оплате', 'to_pay_payouts_count')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    $class = $row->danger_payouts_count > 0 ? 'bg-danger' : 'bg-secondary';

                    return '<a class="badge ' . $class . '" href="' . route('admin.recruiter.payouts', $row) . '">' . $value . '</a>';
                })
                ->asHtml(),

            Column::make(__('Last Activity'), 'last_activity')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return $row->last_activity ? $row->last_activity->timezone(config('app.correct_timezone'))->format('d.m.Y H:i') : '-';
                }),

            Column::make(__('Status'), 'status')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return view('backend.recruiter.includes.status', ['value' => $value]);
                }),

            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.recruiter.includes.actions', ['model' => $row]);
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

    public function activate($id)
    {
        $user = User::find($id);
        $user->status = User::STATUS_ACTIVE;
        $user->timestamps = false;
        $user->save();

        $company = $user->company;
        $company->moderated = 1;
        $company->timestamps = false;
        $company->save();
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
