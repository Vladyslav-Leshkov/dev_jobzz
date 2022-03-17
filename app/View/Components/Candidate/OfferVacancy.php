<?php

namespace App\View\Components\Candidate;

use App\Models\Job\CandidateProfile;
use App\Models\Job\Vacancy;
use App\Services\Frontend\Job\CandidateService;
use Closure;
use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class OfferVacancy extends Component
{
    public CandidateProfile $profile;

    public $vacancies = [];

    public $already_sent = [];

    public $comment = '';

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct(CandidateProfile $profile)
    {
        //
        $this->profile = $profile;
        $this->comment = site_option('candidate_offer_text');
        if (current_user()->isRecruiter()) {
            $company = current_user()->company;
            $this->vacancies = $company->vacancies()->whereIn('status', [Vacancy::STATUS_ACTIVE, Vacancy::STATUS_ANONYMOUS])->get();
            $this->already_sent = CandidateService::vacancyOfferIds($profile->user_id, current_user()->id);
        }
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return View|Closure|string
     */
    public function render()
    {
        return view('components.candidate.offer-vacancy');
    }
}
