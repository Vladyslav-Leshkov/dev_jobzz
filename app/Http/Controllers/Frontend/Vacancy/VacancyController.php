<?php

namespace App\Http\Controllers\Frontend\Vacancy;

use App\Http\Controllers\Controller;
use App\Http\Requests\ConfirmOfferRequest;
use App\Http\Requests\JobApplicationRequest;
use App\Models\Job\Offer;
use App\Models\Job\Specialization;
use App\Models\Job\Vacancy;
use App\Models\Job\Visitable;
use App\Notifications\CandidateOpenContact;
use App\Services\Frontend\Job\CandidateService;
use App\Services\Frontend\Job\VacancyService;
use App\Services\MessengerService;
use App\Services\NotificationService;
use Exception;
use Illuminate\Contracts\View\View;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class VacancyController extends Controller
{
    //
    /**
     * Все вакансии (Поиск)
     *
     * @param Request $request
     *
     * @return View
     */
    public function index(Request $request)
    {
        $vacancies = Vacancy::active()->whereHas('user')->with(['company', 'cities', 'user', 'employment_types', 'specializations'])
            ->filter($request->all())->orderBy('created_at', 'desc')->paginate(10);
        $total = Vacancy::active()->count();
        $options = VacancyService::getOptions();
        $page_title = plural_form($total, ['вакансия', 'вакансии', 'вакансий']) . ' на JOBZZ.RU';

        return view('frontend.vacancy.index', ['vacancies' => $vacancies, 'total' => $total, 'options' => $options, 'page_title' => $page_title]);
    }

    /**
     * Вакансии по моему профилю
     *
     * @param Request $request
     *
     * @return View
     */
    public function my(Request $request)
    {
        $profile = current_user()->candidate_profile;
        $filter_params = $profile ? $profile->getFilterParams($request->all()) : [];

        $vacancies = Vacancy::active()->whereHas('user')->with(['company', 'cities', 'user', 'employment_types', 'specializations'])
            ->filter($filter_params)->orderBy('created_at', 'desc')->paginate(10);

        $total = Vacancy::active()->filter($profile ? $profile->getFilterParams() : [])->count();
        $options = VacancyService::getOptions();

        return view('frontend.vacancy.my', ['vacancies' => $vacancies, 'total' => $total, 'options' => $options, 'filter_params' => $filter_params]);
    }

    /**
     * Страница вакансии
     *
     * @param Vacancy $vacancy
     *
     * @return View
     */
    public function show(Vacancy $vacancy)
    {
        $vacancy->loadMissing(['company', 'cities', 'user', 'employment_types', 'specializations']);
        if (is_candidate()) {
            current_user()->markVisitedVacancy($vacancy->id);
        }

        return view('frontend.vacancy.show', ['vacancy' => $vacancy]);
    }

    /**
     * Отклик на вакансию
     *
     * @param JobApplicationRequest $request
     * @param Vacancy $vacancy
     *
     * @return JsonResponse
     */
    public function offer(JobApplicationRequest $request, Vacancy $vacancy)
    {
        $profile = current_user()->candidate_profile;
        $exists = $profile->offers()->where('vacancy_id', $vacancy->id)->count() > 0;
        if ($exists) {
            return response()->json(['result' => 'error', 'message' => __('A job application has already been submitted')]);
        }

        $params = $request->validated();
        $params['vacancy_id'] = $vacancy->id;
        $params['recruiter_id'] = $vacancy->user_id;
        $params['candidate_id'] = $profile->user_id;
        $offer = VacancyService::createJobApplication($params, $profile);

        $message = MessengerService::sendOfferMessage($offer);

        $params_data = [
            'email' => $profile->email,
            'attachment' => $message->attachment,
        ];
        CandidateService::openData($profile->user_id, $vacancy->user_id, $params_data);

        NotificationService::jobApplicationNotification($vacancy->user, current_user(), $vacancy);

        if ($request->ajax()) {
            return response()->json(['result' => 'success', 'message' => __('Job Application Sent'), 'offer' => $offer]);
        }

        return redirect()->route('frontend.vacancy.show', $vacancy)->withFlashSuccess(__('Job Application Sent'));
    }

    /**
     * Страница вакансии по специализации
     *
     * @param Request $request
     * @param Specialization $specialization
     *
     * @return View
     */
    public function specialization(Request $request, Specialization $specialization)
    {
        $vacancies = $specialization->vacancies()->active()->with(['company', 'cities', 'user', 'employment_types', 'specializations'])
            ->filter($request->all())->orderBy('created_at', 'desc')->paginate(5);
        $total = Vacancy::active()->count();
        $options = VacancyService::getOptions();
        $page_title = plural_form($total, ['вакансия', 'вакансии', 'вакансий']) . ' в специализации  ' . $specialization->title;

        return view('frontend.vacancy.index', [
            'vacancies' => $vacancies,
            'total' => $total,
            'options' => $options,
            'page_title' => $page_title,
            'specialization' => $specialization,
        ]);
    }

    /**
     * Подтверждение найма кандидатом
     *
     * @param ConfirmOfferRequest $request
     * @param Offer $offer
     *
     * @return JsonResponse
     */
    public function confirm(ConfirmOfferRequest $request, Offer $offer)
    {
        $success = VacancyService::confirmHiring($offer, $request->released_to_work);
        if ($request->ajax()) {
            return response()->json([
                'result' => $success ? 'success' : 'error',
                'message' => $success ? 'Найм подтвержден' : 'Произошла ошибка',
            ]);
        }
        if ($success) {
            return redirect()->route('frontend.profile.vacancy.index')->withFlashSuccess(__('Vacancy Archived'));
        }

        return redirect()->route('frontend.profile.vacancy.index')->withFlashWarning(__('An error has occurred'));
    }
}
