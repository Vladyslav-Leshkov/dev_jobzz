<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Job\Vacancy;
use Illuminate\Http\Request;

class VacancyController extends Controller
{


    public function index(Request $request)
    {
        $user_id = current_user_id() ?? 0;
        return Vacancy::active()->whereHas('user')
            ->with(['company', 'cities', 'user', 'employment_types', 'specializations', 'specializations.type'])
            ->withCount(['visitors' => fn($q) => $q->where('user_id', $user_id)])
            ->filter($request->all())
            ->orderBy('created_at', 'desc')->paginate(10);
    }

    public function show(Vacancy $vacancy)
    {
        $vacancy->loadMissing(['company', 'cities', 'user', 'employment_types', 'specializations']);

        return $vacancy;
    }
}
