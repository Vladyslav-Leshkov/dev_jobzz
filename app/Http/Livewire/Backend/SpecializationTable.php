<?php

namespace App\Http\Livewire\Backend;

use App\Models\Job\Specialization;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filter;

/**
 * Class UsersTable.
 */
class SpecializationTable extends DataTableComponent
{

    /**
     * @var string
     */
    public string $defaultSortColumn = 'title_ru';

    public string $defaultSortDirection = 'asc';

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
        $query = Specialization::with(['type', 'skills'])
            ->when($this->getFilter('type'), fn($query, $type) => $query->where('type_id', $type));

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

            Column::make(__('Title'), 'title_ru')
                ->searchable()
                ->sortable(),

            Column::make('Категория', 'type_id')
                ->format(function ($value, $column, $row) {
                    return $row->type->title_ru;
                })
                ->sortable(),

            Column::make('Популярный', 'popular')
                ->format(function ($value, $column, $row) {
                    return view('backend.specialization.includes.popular', ['model' => $row]);
                })
                ->sortable(),

            Column::make('Рекомендуемые скилы')
                ->format(function ($value, $column, $row) {
                    return view('backend.specialization.includes.skills', ['model' => $row]);
                }),

            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.specialization.includes.actions', ['model' => $row]);
                }),
        ];
    }

    public function filters(): array
    {
        return [
            'type' => Filter::make('Категория')
                ->select([
                    '' => 'Любая',
                    1 => 'Разработка',
                    2 => 'Другие технические',
                    3 => 'Нетехнические',
                ]),

        ];
    }
}
