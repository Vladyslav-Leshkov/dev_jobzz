<?php

namespace App\Http\Controllers\Frontend\Candidate;

use App\Http\Controllers\Controller;
use App\Http\Requests\CandidateOfferRequest;
use App\Models\Job\CandidateProfile;
use App\Services\Frontend\Job\CandidateService;
use App\Services\Frontend\Job\ProfileService;
use App\Services\MessengerService;
use App\Services\NotificationService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class CandidateController extends Controller
{
    public function index(Request $request)
    {
        $candidates = CandidateProfile::active()->filter()->with([
            'user',
            'employment_types',
            'cities',
            'skills',
        ])->orderBy('created_at', 'desc')->paginate(10);
        $total = CandidateProfile::active()->count();
        $options = ProfileService::getProfileOptions();

        return view('frontend.candidate.index', [
            'candidates' => $candidates,
            'total' => $total,
            'options' => $options,
        ]);
    }

    public function show(CandidateProfile $profile)
    {
        if (is_recruiter()) {
            current_user()->markVisitedCandidate($profile->id);
        }
        return view('frontend.candidate.show', ['profile' => $profile]);
    }

    public function offer(CandidateOfferRequest $request, CandidateProfile $profile)
    {
        $exists = $profile->offers()->where('vacancy_id', $request->vacancy_id)->count() > 0;
        if ($exists) {
            return response()->json(['result' => 'error', 'message' => __('Job offer has already been sent')]);
        }

        $params = $request->validated();
        $params['recruiter_id'] = current_user()->id;
        $params['candidate_id'] = $profile->user_id;
        $offer = CandidateService::createVacancyOffer($params);

        MessengerService::sendOfferMessage($offer);


        NotificationService::jobOfferNotification($profile->user, current_user(), $params['vacancy_id']);
        if ($request->ajax()) {
            return response()->json(['result' => 'success', 'message' => __('Offer Sent'), 'offer' => $offer]);
        }

        return redirect()->route('frontend.candidate.show', $profile)->withFlashSuccess(__('Offer Sent'));
    }

    public function resume(CandidateProfile $profile)
    {
        if ($profile->resume && Storage::exists($profile->resume)) {
            return response()->download(Storage::path($profile->resume), $profile->resume_name);
        }
        abort(404, __('File not found'));
    }
}
