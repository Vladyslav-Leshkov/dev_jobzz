<?php

namespace App\Http\Livewire\Backend;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filter;

/**
 * Class UsersTable.
 */
class UsersTable extends DataTableComponent
{
    public array $perPageAccepted = [20, 50, 100];

    public ?int $searchFilterDebounce = 300;

    public ?bool $searchFilterDefer = true;

    /**
     * @var string
     */
    public string $defaultSortColumn = 'id';

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
     * @param  string  $status
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
        $query = User::with('roles')
            ->when($this->getFilter('type'), fn ($query, $type) => $query->where('type', $type));

        if ($this->status === 'deleted') {
            return $query->onlyTrashed();
        }

        if ($this->status === 'blocked') {
            return $query->onlyDeactivated();
        }

        if ($this->status === 'inactive') {
            return $query->onlyInactive();
        }

        return $query->onlyActive();
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
                    return view('backend.auth.user.includes.info', ['model' => $row]);
                })
                ->sortable()
                ->asHtml(),

            Column::make(__('Type'), 'type')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return view('backend.auth.user.includes.type', ['user' => $row]);
                }),

            Column::make(__('E-mail'), 'email')
                ->searchable()
                ->sortable()
                ->format(function ($value) {
                    return '<a href="mailto:'.$value.'">'.$value.'</a>';
                })
                ->asHtml(),
            Column::make(__('Phone'), 'phone')
                ->searchable()
                ->sortable()
                ->format(function ($value) {
                    return '<a href="tel:'.clear_phone($value).'">'.$value.'</a>';
                })
                ->asHtml(),
            Column::make(__('Verified'), 'email_verified_at')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    return view('backend.auth.user.includes.verified', ['user' => $row]);
                }),


            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.auth.user.includes.actions', ['user' => $row]);
                }),
        ];
    }

    public function filters(): array
    {
        return [
            'type' => Filter::make('Type')
                ->select([
                    '' => 'Любой',
                    User::TYPE_ADMIN => 'Админ',
                    User::TYPE_CANDIDATE => 'Кандидат',
                    User::TYPE_RECRUITER => 'Рекрутер',
                    User::TYPE_SUPPORT => 'Поддержка',
                ]),

        ];
    }
}
