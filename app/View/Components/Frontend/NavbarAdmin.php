<?php

namespace App\View\Components\Frontend;

use App\Models\Job\CandidateProfile;
use App\Models\Job\Vacancy;
use Illuminate\View\Component;

class NavbarAdmin extends Component
{
    public $last_vacancies = [];
    public $last_candidates = [];
    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
        $this->last_vacancies = Vacancy::active()->orderBy('created_at', 'desc')->take(6)->get();
        $this->last_candidates = CandidateProfile::active()->orderBy('created_at', 'desc')->take(6)->get();
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.frontend.navbar-admin');
    }
}
