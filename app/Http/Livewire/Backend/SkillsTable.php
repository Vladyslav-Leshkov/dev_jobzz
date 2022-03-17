<?php

namespace App\Http\Livewire\Backend;

use App\Models\Job\Skill;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filter;

/**
 * Class UsersTable.
 */
class SkillsTable extends DataTableComponent
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
        $is_custom = (int)$this->getFilter('is_custom');
        $query = Skill::query()->withCount(['candidates', 'vacancies'])
            ->when($is_custom === 1 || $is_custom === 0, fn($query) => $query->where('is_custom', $is_custom));

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

            Column::make(__('Title RU'), 'title_ru')
                ->searchable()
                ->sortable(),

            Column::make(__('Title EN'), 'title_en')
                ->searchable()
                ->sortable(),

            Column::make(__('Кандидатов'), 'candidates_count')
                ->searchable()
                ->sortable(),

            Column::make(__('Вакансий'), 'vacancies_count')
                ->searchable()
                ->sortable(),

//            Column::make('Популярный', 'popular')
//                ->format(function ($value, $column, $row) {
//                    return view('backend.skill.includes.popular', ['model' => $row]);
//                })
//                ->sortable(),

            Column::make('Создан пользователем', 'is_custom')
                ->format(function ($value, $column, $row) {
                    return view('backend.skill.includes.custom', ['model' => $row]);
                })
                ->sortable(),

            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.skill.includes.actions', ['model' => $row]);
                }),
        ];
    }

    public function filters(): array
    {
        return [
            'is_custom' => Filter::make('Пользовательский')
                ->select([
                    '' => 'Любой',
                    0 => 'Нет',
                    1 => 'Да',
                ]),

        ];
    }
}
