<?php

namespace App\Http\Livewire\Backend;

use App\Models\Job\Company;
use App\Models\Job\Skill;
use App\Models\Job\Specialization;
use App\Models\Job\Vacancy;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filter;

/**
 * Class UsersTable.
 */
class CompaniesTable extends DataTableComponent
{

    /**
     * @var string
     */
    public string $defaultSortColumn = 'title';

    public string $defaultSortDirection = 'asc';

    public array $perPageAccepted = [20, 50, 100];

    public ?int $searchFilterDebounce = 300;

    public ?bool $searchFilterDefer = true;

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
        $query = Company::query()->with('users');


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

            Column::make(__('Logo'), 'logo')
                ->format(function ($value, $column, $row) {
                    return "<img src='$row->logo_url' height='60' alt='' />";
                })
                ->asHtml(),


            Column::make(__('Title'), 'title')
                ->searchable()
                ->sortable(),

            Column::make(__('User'))
                ->format(function ($value, $column, Company $row) {
                    return $row->users->implode('name', ', ');
                }),

            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.company.includes.actions', ['model' => $row]);
                }),
        ];
    }

}
