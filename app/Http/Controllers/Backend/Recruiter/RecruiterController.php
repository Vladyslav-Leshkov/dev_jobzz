<?php

namespace App\Http\Controllers\Backend\Recruiter;

use App\Http\Controllers\Controller;
use App\Models\Auth\User;
use App\Models\Job\Vacancy;
use Illuminate\Http\Request;

class RecruiterController extends Controller
{
    //

    public function index()
    {
        return view('backend.recruiter.index');
    }

    public function show(User $user)
    {
        return view('backend.recruiter.show', ['user'=>$user]);
    }


    public function vacancies(User $user)
    {
        return view('backend.recruiter.vacancies', ['user'=>$user]);
    }


    public function payouts(User $user)
    {
        return view('backend.recruiter.payouts', ['user'=>$user]);
    }

    public function showVacancy(User $user, Vacancy $vacancy)
    {
        return view('backend.recruiter.vacancy', ['user'=>$user, 'vacancy'=>$vacancy]);
    }
}
