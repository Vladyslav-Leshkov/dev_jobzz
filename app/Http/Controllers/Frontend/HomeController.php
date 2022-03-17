<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Content\Page;
use App\Models\Job\Partner;
use App\Models\Job\SpecializationType;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    //

    public function index()
    {
        if (Auth::check()) {
            if (current_user()->type === null) {
                return redirect()->route('frontend.auth.role.index');
            }

            if (current_user()->isCandidate()) {
                return redirect()->route('frontend.vacancy.index');
            }

            if (current_user()->isRecruiter()) {
                return redirect()->route('frontend.candidate.index');
            }
        }

        $spec_types = SpecializationType::popular()->with(['items' => function ($query) {
            $query->where('popular', 1)->withCount(['vacancies' => fn($q) => $q->onlyActive()])->orderBy('vacancies_count', 'desc');
        }])->withCount(['items'])->orderBy('items_count', 'desc')->take(2)->get();

        $partners = Partner::all()->chunk(12);

        $pageContent = Page::whereSlug('home')->first();

        return view('frontend.home.index', [
            'spec_types' => $spec_types,
            'partners' => $partners,
            'pageContent' => $pageContent,
        ]);
    }

    public function offline()
    {
        return view('frontend.home.offline');
    }
}
