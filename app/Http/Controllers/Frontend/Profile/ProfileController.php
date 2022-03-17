<?php

namespace App\Http\Controllers\Frontend\Profile;

use App\Http\Controllers\Controller;
use App\Models\Auth\User;
use App\Models\Content\Page;
use App\Services\Frontend\Job\CandidateService;
use App\Services\Frontend\Job\ProfileService;
use App\Services\Frontend\Job\RecruiterService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class ProfileController extends Controller
{
    //

    public function agree(Request $request)
    {
        $user = current_user();
        if ((int)$request->input('agree') === 0) {
            Auth::guard('web')->logout();
            $request->session()->invalidate();
            $request->session()->regenerateToken();
            $user->forceDelete();

            return redirect('/');
        } elseif ((int)$request->input('agree') === 1) {
            $user->agree = 1;
            $user->save();

            return redirect()->route('frontend.profile.wizard.index')->withFlashInfo(__('Please fill in your profile.'));
        }
        abort(400);
    }

    public function store(Request $request)
    {
        $user = current_user();
        if ($user->isCandidate()) {
            CandidateService::createOrUpdateProfile($user, $request);
            return redirect()->route('frontend.vacancy.index')->withFlashSuccess(__('Profile Created'));
        }
        if ($user->isRecruiter()) {
            RecruiterService::createOrUpdateProfile($user, $request);

            return redirect()->route('frontend.candidate.index')->withFlashSuccess(__('Profile Created'));
        }

        return redirect()->route('frontend.profile.index')->withFlashSuccess(__('Profile Created'));
    }

    public function preview()
    {
        $user = current_user();


        return $user->status === User::STATUS_INACTIVE ? $this->wizard() : $this->index();
    }

    public function wizard()
    {
        $user = current_user();
        if ($user->isCandidate()) {
            $options = ProfileService::getProfileOptions();

            return view('frontend.profile.candidate-wizard', ['user' => $user, 'options' => $options]);
        }

        if ($user->isRecruiter()) {
            if ($user->agree === 0) {
                $pageContent = Page::whereSlug('rules')->first();

                return view('frontend.profile.recruiter-agree', ['user' => $user, 'pageContent' => $pageContent]);
            }

            return view('frontend.profile.recruiter-wizard', ['user' => $user]);
        }

        throw new NotFoundHttpException(__('Page Not Found'));
    }

    public function index()
    {
        $user = current_user();

        $options = [];
        $model = (object)[];

        if ($user->isCandidate()) {
            $options = ProfileService::getProfileOptions();
            $model = $user->candidate_profile()->with(['cities', 'employment_types', 'specializations', 'skills', 'additional_skills'])->first();
        }

        if ($user->isRecruiter()) {
            $model = $user->company;
        }

        return view('frontend.profile.index', ['user' => $user, 'options' => $options, 'model' => $model]);
    }


    public function update(Request $request)
    {

        $user = current_user();
        $emailChanged = !empty($request->email) && $user->email !== $request->email;
        if ($user->isCandidate()) {
            CandidateService::createOrUpdateProfile($user, $request);
        }
        if ($user->isRecruiter()) {
            RecruiterService::createOrUpdateProfile($user, $request);
        }
        if ($emailChanged) {
            $user->email_verified_at = null;
            $user->save();
            $user->sendEmailVerificationNotification();
            return redirect()->route('frontend.auth.verification.notice')->withFlashInfo(__('Verify Your E-mail Address'));
        }
        return redirect()->route('frontend.profile.index')->withFlashSuccess(__('Profile Updated'));
    }

    public function status(Request $request, $status)
    {
        $user = current_user();
        if ($user->isCandidate()) {
            CandidateService::setProfileStatus($user, $status);
        }

        if ($request->ajax()) {
            return response()->json(['result' => 'success', 'message' => __('Status Updated')]);
        }

        return redirect()->route('frontend.profile.index')->withFlashSuccess(__('Status Updated'));
    }

    public function blocked()
    {
        return view('frontend.profile.blocked');
    }
}
