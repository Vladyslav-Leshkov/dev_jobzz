<?php

namespace App\Http\Livewire\Backend;

use App\Models\Content\LanguageLine;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Str;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use Rappasoft\LaravelLivewireTables\Views\Filter;

class LanguageLineTable extends DataTableComponent
{
    public function columns(): array
    {
        return [
            Column::make(__('Group'), 'group')
                ->sortable(),

            Column::make(__('Key'), 'key')
                ->searchable()
                ->sortable(),

            Column::make(__('Translations'), 'text')
                ->searchable(function (Builder $query, $searchTerm) {
                    return $query->orJsonLike('text', "%$searchTerm%");
                })
                ->format(function ($value, $column, $row) {
                    return view('backend.translation.includes.translations', ['language_line' => $row, 'locales'=>config('site-settings.locale.languages')]);
                }),

            Column::make(__('Actions'))
                ->format(function ($value, $column, $row) {
                    return view('backend.translation.includes.actions', ['language_line' => $row]);
                }),
        ];
    }

    public function query()
    {
        $group = $this->getFilter('group') ?? false;

        return LanguageLine::query()
            ->when($group, fn($q) => $q->where('group', $group));
    }

    public function filters(): array
    {
        $groups = ['' => __('All')];
        $availableGroups = LanguageLine::select('group')->distinct()->pluck('group')->toArray();
        foreach ($availableGroups as $group) {
            if ($group === '*') {
                $groups[$group] = __('Strings');
            } else {
                $groups[$group] = Str::ucfirst(str_replace('-', ' ', $group));
            }
        }
        return [
            'group' => Filter::make(__('Group'))->select($groups),
        ];
    }
}
