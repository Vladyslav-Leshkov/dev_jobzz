<?php

namespace App\Http\Controllers\Frontend\Profile;

use App\Http\Controllers\Controller;
use App\Models\Auth\User;
use App\Models\Content\HtmlBlock;
use App\Models\Job\Offer;
use App\Services\Frontend\Auth\UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class ProfileDeleteController extends Controller
{
    //

    public function index()
    {
        /**
         * @var User $user
         */
        $user = current_user();
        $ask_a_question = $user->cnadidateOffers()
                ->where('candidate_status', '<>', Offer::STATUS_CONFIRMED)
                ->where('recruiter_status', '<>', Offer::STATUS_CONFIRMED)->count() > 0 &&
            $user->openDatas()->count() > 0;

        $textBlock = HtmlBlock::whereSlug('account_delete')->first();

        return view('frontend.profile.delete', compact('ask_a_question', 'textBlock'));
    }


    public function confirm(Request $request)
    {
        $user = current_user();
        if ((int)$request->input('confirm', 0) === 1) {


            UserService::deleteAccount($user);


            Auth::guard('web')->logout();

            $request->session()->invalidate();

            $request->session()->regenerateToken();

            return redirect()->route('frontend.home.index')->withFlashSuccess(__('Account Deleted'));
        }

        return $user->isCandidate() ? redirect()->route('frontend.profile.contact.index') : redirect()->route('frontend.profile.index');
    }
}
