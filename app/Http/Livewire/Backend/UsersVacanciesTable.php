<?php

namespace App\Http\Livewire\Backend;

use App\Models\Auth\User;
use App\Models\Job\Vacancy;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filter;

/**
 * Class UsersVacanciesTable.
 */
class UsersVacanciesTable extends DataTableComponent
{
    public ?int $searchFilterDebounce = 300;

    public ?bool $searchFilterDefer = true;

    
    /**
     * @var int|null
     */
    public $deleteId = 0;


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
     * @param  User $user
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
        $query = Vacancy::where('user_id', $this->user->id)
            ->when($this->getFilter('status'), fn ($query, $status) => $query->where('status', $status));

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

            Column::make(__('Title'), 'title')
                ->searchable()
                ->sortable(),


            Column::make(__('Status'), 'status')
                ->sortable()
                ->format(function ($value) {
                    return view('backend.vacancy.includes.status', ['value' => $value]);
                }),


            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.recruiter.includes.vacancy-actions', ['model' => $row]);
                }),
        ];
    }

    public function filters(): array
    {
        return [
            'status' => Filter::make('Статус')
                ->select([
                    '' => 'Любой',
                    Vacancy::STATUS_INACTIVE => 'Не активно',
                    Vacancy::STATUS_ACTIVE => 'Активно',
                    Vacancy::STATUS_ANONYMOUS => 'Анонимные',
                    Vacancy::STATUS_ARCHIVED => 'Архивные',
                    Vacancy::STATUS_BLOCKED => 'Заблокированные',

                ]),

        ];
    }


    public function unlock($id)
    {
        $model = Vacancy::find($id);
        $model->status = Vacancy::STATUS_ACTIVE;
        $model->timestamps = false;
        $model->save();
    }

    public function lock($id)
    {
        $model = Vacancy::find($id);
        $model->status = Vacancy::STATUS_BLOCKED;
        $model->timestamps = false;
        $model->save();
    }


    public function deleteId($id)
    {
        $this->deleteId = $id;
    }

    public function delete()
    {
        $model = Vacancy::find($this->deleteId);
        $model->delete();
    }
}
