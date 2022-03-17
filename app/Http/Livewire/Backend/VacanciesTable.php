<?php

namespace App\Http\Livewire\Backend;

use App\Models\Job\Vacancy;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;

/**
 * Class UsersTable.
 */
class VacanciesTable extends DataTableComponent
{

    public bool $singleColumnSorting = true;

    public ?int $searchFilterDebounce = 300;

    public ?bool $searchFilterDefer = true;

    public array $sorts = [
        'id' => 'desc'
    ];

    public array $perPageAccepted = [20, 50, 100];

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
        $query = Vacancy::with(['user', 'specializations']);

        if ($this->status === 'deleted') {
            return $query->onlyTrashed();
        }

        if ($this->status === 'blocked') {
            return $query->onlyBlocked();
        }

        if ($this->status === 'hold') {
            return $query->onlyInactive();
        }

        if ($this->status === 'archived') {
            return $query->onlyArchived();
        }

        if ($this->status === 'anonymous') {
            return $query->onlyAnonymous();
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

            Column::make(__('Title'), 'title')
                ->searchable()
                ->sortable(),

            Column::make(__('Recruiter'))
                ->format(function ($value, $column, $row) {
                    return $row->user ? $row->user->name : 'User Deleted';
                }),

            Column::make(__('Specialization'))
                ->format(function ($value, $column, Vacancy $row) {
                    return $row->specializations->implode('title_ru', ', ');
                }),

            Column::make(__('Publish Date'))
                ->sortable()
                ->format(function ($value, $column, Vacancy $row) {
                    return $row->created_at->format('d.m.Y H:i');
                }),

            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.vacancy.includes.actions', ['vacancy' => $row]);
                }),
        ];
    }
}
