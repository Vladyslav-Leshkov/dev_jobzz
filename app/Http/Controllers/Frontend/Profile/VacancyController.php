<?php

namespace App\Http\Controllers\Frontend\Profile;

use App\Http\Controllers\Controller;
use App\Http\Middleware\RecruiterCheck;
use App\Http\Requests\ConfirmOfferRequest;
use App\Models\Job\CandidateOpenData;
use App\Models\Job\Offer;
use App\Models\Job\Vacancy;
use App\Services\Frontend\Job\PushQuestionService;
use App\Services\Frontend\Job\VacancyService;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Gate;
use Illuminate\Contracts\View\View;

class VacancyController extends Controller
{
    public function __construct()
    {
        $this->middleware(RecruiterCheck::class);
    }

    /**
     * Display a listing of the resource.
     *
     * @param Request $request
     * @param string|null $status
     *
     * @return View
     */
    public function index(Request $request, string $status = 'active'): View
    {
        //
        $user = current_user();
        $vacancies = $user->company->vacancies()->withCount(['candidates' => function ($q) use ($user) {
            return $q->withTrashed()->whereHas('openDatas', fn($sq) => $sq->where('recruiter_id', $user->id));
        }])
            ->where('status', Vacancy::$statuses[$status])
            ->orderBy('created_at', 'desc')
            ->paginate(20);

        return view('frontend.profile.vacancy.index', ['vacancies' => $vacancies, 'status' => $status]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return View
     */
    public function create(): View
    {
        $user = current_user();
        $company = $user->company;

        $vacancy = new Vacancy();
        $vacancy->user_id = $user->id;
        $vacancy->company_id = $company->id;
        $options = VacancyService::getOptions();
        $anonymous_count = $user->vacancies()->where('status', Vacancy::STATUS_ANONYMOUS)->count();

        return view('frontend.profile.vacancy.create', [
            'options' => $options,
            'vacancy' => $vacancy,
            'user' => $user->shortInfo(),
            'company' => $company,
            'anonymous_count' => $anonymous_count,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     *
     * @return RedirectResponse
     */
    public function store(Request $request): RedirectResponse
    {
        $vacancy = new Vacancy();
        $user = current_user();
        $company = $user->company;
        $vacancy->company_id = $company->id;
        $vacancy->user_id = $user->id;
        VacancyService::createOrUpdateVacancy($vacancy, $request->all());

        return redirect()->route('frontend.profile.vacancy.index')->withFlashSuccess(__('Vacancy Created'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param Vacancy $vacancy
     *
     * @return View
     */
    public function edit(Vacancy $vacancy): View
    {
        $options = VacancyService::getOptions();
        $vacancy->loadMissing(['specializations', 'cities', 'employment_types']);
        $user = $vacancy->user;
        $company = $vacancy->company;
        $anonymous_count = $user->vacancies()->where('status', Vacancy::STATUS_ANONYMOUS)
            ->where('id', '<>', $vacancy->id)->count();

        return view('frontend.profile.vacancy.edit', [
            'options' => $options,
            'vacancy' => $vacancy,
            'user' => $user->shortInfo(),
            'company' => $company,
            'anonymous_count' => $anonymous_count,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Vacancy $vacancy
     *
     * @return RedirectResponse
     */
    public function update(Request $request, Vacancy $vacancy): RedirectResponse
    {
        VacancyService::createOrUpdateVacancy($vacancy, $request->all());

        return redirect()->route('frontend.profile.vacancy.index')->withFlashSuccess(__('Vacancy Updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Vacancy $vacancy
     *
     * @return RedirectResponse
     */
    public function destroy(Vacancy $vacancy): RedirectResponse
    {
        $vacancy->delete();

        return redirect()->route('frontend.profile.vacancy.index')->withFlashSuccess(__('Vacancy Deleted'));
        //
    }

    /**
     * @param Vacancy $vacancy
     *
     * @return RedirectResponse
     * @throws AuthorizationException
     *
     */
    public function hold(Vacancy $vacancy): RedirectResponse
    {
        Gate::authorize('owner-vacancy', $vacancy);
        $vacancy->status = Vacancy::STATUS_INACTIVE;
        $vacancy->status_expired = Carbon::now()->addDays(7);
        $vacancy->save();

        return redirect()->route('frontend.profile.vacancy.index')->withFlashSuccess(__('Vacancy Updated'));
    }

    /**
     * @param Vacancy $vacancy
     *
     * @return RedirectResponse
     * @throws AuthorizationException
     *
     */
    public function activate(Request $request, Vacancy $vacancy): RedirectResponse
    {
        Gate::authorize('owner-vacancy', $vacancy);
        $vacancy->status = Vacancy::STATUS_ACTIVE;
        $vacancy->status_expired = null;
        if ($request->input('publish', 0) == 1) {
            $vacancy->created_at = Carbon::now();
        }
        $vacancy->save();

        return redirect()->back()->withFlashSuccess(__('Vacancy Updated'));
    }

    public function candidates(Vacancy $vacancy)
    {
        $candidateIds = CandidateOpenData::where('recruiter_id', current_user()->id)->pluck('candidate_id')->toArray();
        $offers = $vacancy->offers()->whereIn('candidate_id', $candidateIds)->with([
            'candidate' => fn($q) => $q->withTrashed(),
            'candidate.candidate_profile' => fn($q) => $q->withTrashed(),
            'candidate.candidate_profile.employment_types'
        ])->orderBy('created_at', 'desc')->get();

        return view('frontend.profile.vacancy.candidates', [
            'vacancy' => $vacancy,
            'offers' => $offers,
        ]);
    }

    /**
     * @param Vacancy $vacancy
     *
     * @return RedirectResponse|JsonResponse
     * @throws AuthorizationException
     *
     */
    public function close(Request $request, Vacancy $vacancy)
    {
        Gate::authorize('owner-vacancy', $vacancy);
        VacancyService::archive($vacancy);
        PushQuestionService::vacancyClosedCandidates($vacancy);

        if ($request->ajax()) {
            return response()->json(['result' => 'success', 'message' => __('Vacancy Archived')]);
        }

        return redirect()->route('frontend.profile.vacancy.index')->withFlashSuccess(__('Vacancy Archived'));
    }


    public function confirm(ConfirmOfferRequest $request, Offer $offer)
    {
        $vacancy = $offer->vacancy;
        Gate::authorize('owner-vacancy', $vacancy);
        $success = VacancyService::confirmOffer($offer, $request->released_to_work);
        if ($success) {
            VacancyService::archive($vacancy);
        }

        if ($request->ajax()) {
            return response()->json([
                'result' => $success ? 'success' : 'error',
                'message' => $success ? 'Вакансия закрыта' : 'Произошла ошибка',
            ]);
        }
        if ($success) {
            return redirect()->route('frontend.profile.vacancy.index')->withFlashSuccess(__('Vacancy Archived'));
        }

        return redirect()->route('frontend.profile.vacancy.index')->withFlashWarning(__('An error has occurred'));
    }
}
