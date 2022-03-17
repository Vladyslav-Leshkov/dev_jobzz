<?php

namespace App\Http\Controllers\Frontend\Company;

use App\Http\Controllers\Controller;
use App\Models\Job\Company;

class CompanyController extends Controller
{
    //

    public function show(Company $company)
    {
        $vacancies = $company->vacancies()->with(['user'])->active()->orderBy('created_at', 'desc')->get();

        return view('frontend.company.show', ['company'=>$company, 'vacancies'=>$vacancies]);
    }
}
