<?php

namespace App\Http\Controllers\Frontend\Profile;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdateContactsRequest;
use App\Services\Frontend\Job\CandidateService;
use Illuminate\Http\Request;

class ProfileContactsController extends Controller
{
    //

    public function index()
    {
        $user = current_user();
        $profile = $user->candidate_profile;

        return view('frontend.profile.contacts', ['user'=>$user, 'profile'=>$profile]);
    }

    public function update(UpdateContactsRequest $request)
    {
        $user = current_user();
        CandidateService::updateContacts($user, $request->validated());

        return redirect()->route('frontend.profile.contact.index')->withFlashSuccess(__('Profile Updated'));
    }
}
