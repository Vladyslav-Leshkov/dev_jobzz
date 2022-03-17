<?php

namespace App\View\Components\Vacancy;

use App\Models\Job\CandidateProfile;
use App\Models\Job\Offer as CandidateOffer;
use App\Models\Job\Vacancy;
use Illuminate\View\Component;

class Offer extends Component
{
    public $vacancy = null;

    public $candidate = null;

    public $comment = '';

    public $regards = '';

    /**
     * @var CandidateOffer|null
     */
    public $offer = null;

    public $submitted = false;

    public $proposed = false;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct(Vacancy $vacancy)
    {
        //

        $this->vacancy = $vacancy;
        $this->candidate = current_user()->candidate_profile ?? new CandidateProfile();
        $this->comment = $this->getComment();
        $this->regards = $this->getRegards();
        $this->offer = $this->candidate->offers()->where('vacancy_id', $vacancy->id)->first();
        if ($this->offer) {
            $this->submitted = $this->offer->initiator === CandidateOffer::INITIATOR_CANDIDATE;
            $this->proposed = $this->offer->initiator === CandidateOffer::INITIATOR_RECRUITER;
        }
    }

    private function getComment()
    {
        $comment = site_option('vacancy_offer_text');
        $tags = [
            '{RECRUITER_NAME}' => $this->vacancy->name,
            '{VACANCY_TITLE}' => $this->vacancy->title,
            '{VACANCY_URL}' => $this->vacancy->url,
            '{CANDIDATE_CONTACT}' => implode("\n", current_user()->getContacts()),
            '{CANDIDATE_NAME}' => current_user()->name,
            '{CANDIDATE_EMAIL}' => current_user()->email,
        ];
        foreach ($tags as $key => $val) {
            $comment = str_replace($key, $val, $comment);
        }

        return trim($comment);
    }

    private function getRegards()
    {
        $comment = site_option('vacancy_regards_text');
        $tags = [
            '{RECRUITER_NAME}' => $this->vacancy->name,
            '{VACANCY_TITLE}' => $this->vacancy->title,
            '{VACANCY_URL}' => $this->vacancy->url,
            '{CANDIDATE_CONTACT}' => implode("\n", current_user()->getContacts()),
            '{CANDIDATE_NAME}' => current_user()->name,
            '{CANDIDATE_EMAIL}' => current_user()->email,
        ];
        foreach ($tags as $key => $val) {
            $comment = str_replace($key, $val, $comment);
        }

        return trim($comment);
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.vacancy.offer');
    }
}
