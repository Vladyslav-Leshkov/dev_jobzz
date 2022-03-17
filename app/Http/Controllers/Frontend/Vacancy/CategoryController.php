<?php

namespace App\Http\Controllers\Frontend\Vacancy;

use App\Http\Controllers\Controller;
use App\Models\Job\Specialization;
use App\Models\Job\SpecializationType;
use App\Models\Job\Vacancy;
use App\Services\Frontend\Job\VacancyService;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    //

    public function index()
    {

        $spec_types = SpecializationType::query()->with(['items' => function ($query) {
            $query->withCount(['vacancies'])->orderBy('vacancies_count', 'desc');
        }])->withCount(['items'])->orderBy('items_count', 'desc')->get();

        return view('frontend.category.index', compact('spec_types'));
    }


    public function type(SpecializationType $type)
    {
        $items = $type->items()->withCount(['vacancies'])->orderBy('vacancies_count', 'desc')->get();
        return view('frontend.category.type', compact('type', 'items'));
    }


}
