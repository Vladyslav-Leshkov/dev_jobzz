<?php

namespace App\Http\Controllers\Frontend\Recruiter;

use App\Http\Controllers\Controller;
use App\Models\Auth\User;
use App\Models\Job\Offer;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class RecruiterController extends Controller
{
    //

    public function show(User $user)
    {
        if (!$user->isRecruiter()) {
            throw new NotFoundHttpException(__('Recruiter not found'));
        }

        $company = $user->company;
        $vacancies = $user->vacancies()->active()->get();

        return view('frontend.recruiter.show', ['user'=>$user, 'company'=>$company, 'vacancies'=>$vacancies]);
    }


    public function confirm()
    {
        $user = current_user();
        $profile = $user->candidate_profile;

        $recruiter_ids = $user->openDatas()->select('recruiter_id')->pluck('recruiter_id')->toArray();
        $offers = $profile->offers()->whereIn('recruiter_id', $recruiter_ids)
            ->where('candidate_status', '<', Offer::STATUS_CONFIRMED)
            ->with(['recruiter', 'recruiter.companies', 'vacancy'])->orderBy('created_at', 'desc')->get();

        return view('frontend.recruiter.confirm', ['offers'=>$offers]);
    }
}
