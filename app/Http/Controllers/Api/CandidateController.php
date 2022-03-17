<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Job\CandidateProfile;
use Illuminate\Http\Request;

class CandidateController extends Controller
{
    //

    public function index(Request $request)
    {
        $user_id = current_user_id() ?? 0;
        return CandidateProfile::active()->with(['cities', 'employment_types', 'specializations', 'skills', 'additional_skills', 'user'])
            ->withCount(['visitors' => fn($q) => $q->where('user_id', $user_id)])
            ->filter($request->all())
            ->orderBy('created_at', 'desc')->paginate(10);
    }

    public function show(CandidateProfile $profile)
    {
        $profile->loadMissing(['cities', 'employment_types', 'specializations', 'skills', 'user']);

        return $profile;
    }
}
