<?php

namespace App\Http\Livewire\Backend;

use App\Models\Auth\Role;
use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;

/**
 * Class RolesTable.
 */
class RolesTable extends DataTableComponent
{

    public ?int $searchFilterDebounce = 300;

    public ?bool $searchFilterDefer = true;


    /**
     * @var array
     */
    protected $options = [
        'bootstrap.container' => false,
        'bootstrap.classes.table' => 'table table-striped',
    ];

    /**
     * @return Builder
     */
    public function query(): Builder
    {
        return Role::with('permissions:id,name,description')
            ->withCount('users');
    }

    /**
     * @return array
     */
    public function columns(): array
    {
        return [
            Column::make(__('Type'), 'type')
                ->sortable()
                ->format(function ($value, $column, $row) {
                    if ($row->type === User::TYPE_ADMIN) {
                        return __('Administrator');
                    }

                    if ($row->type === User::TYPE_CANDIDATE) {
                        return __('candidate.title');
                    }

                    if ($row->type === User::TYPE_RECRUITER) {
                        return __('Recruiter');
                    }

                    return 'N/A';
                }),
            Column::make(__('Name'), 'name')
                ->searchable()
                ->sortable(),
            Column::make(__('Permissions'), 'permissions_label')
                ->searchable(function ($builder, $term) {
                    return $builder->orWhereHas('permissions', function ($query) use ($term) {
                        return $query->where('name', 'like', '%'.$term.'%');
                    });
                }),
            Column::make(__('Number of Users'), 'users_count')
                ->sortable(),
            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.auth.role.includes.actions', ['model' => $row]);
                }),
        ];
    }
}
