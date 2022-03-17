<?php

namespace App\Http\Controllers\Backend\Candidate;

use App\Http\Controllers\Controller;
use App\Models\Auth\User;
use Illuminate\Http\Request;

class CandidateController extends Controller
{
    //
    public function index()
    {
        return view('backend.candidate.index');
    }


    public function show(User $user)
    {
        return view('backend.candidate.show', ['user' => $user]);
    }

    public function openData(User $user)
    {
        $recruiter_ids = $user->openDatas()->get(['recruiter_id'])->pluck('recruiter_id')->toArray();
        $offers = $user->cnadidateOffers()->with(['recruiter', 'vacancy'])
            ->whereIn('recruiter_id', $recruiter_ids)
            ->orderBy('created_at', 'desc')->paginate(20);
        
        return view('backend.candidate.open-data', ['user' => $user, 'offers' => $offers]);
    }
}
