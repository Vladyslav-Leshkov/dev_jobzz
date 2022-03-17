<?php

namespace App\Services\Frontend\Job;

use App\Models\Auth\User;
use App\Models\Job\CandidateProfile;
use App\Models\Job\Offer;
use App\Models\Job\Currency;
use App\Models\Job\EmploymentType;
use App\Models\Job\EnglishLevel;
use App\Models\Job\Experience;
use App\Models\Job\PushQuestion;
use App\Models\Job\Salary;
use App\Models\Job\Skill;
use App\Models\Job\SpecializationType;
use App\Models\Job\Vacancy;
use App\Models\Location\City;
use App\Services\BaseService;
use App\Services\NotificationService;
use Exception;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Throwable;

class VacancyService extends BaseService
{
    /**
     * Создание или обновление вакансии
     *
     * @param Vacancy $vacancy
     * @param array $params
     *
     * @return Vacancy|false
     * @throws Throwable
     *
     */
    public static function createOrUpdateVacancy(Vacancy $vacancy, array $params)
    {
        $is_new = is_null($vacancy->id) || $vacancy->id === 0;
        $old_status = $vacancy->status;

        DB::beginTransaction();

        try {

            //$params['short_description'] = removeLinks(removePhone($params['short_description']));
            //$params['description'] = removeLinks(removePhone($params['description']));
            $vacancy->fill($params);
            if ($params['publish']) {
                $is_publish = (int)$params['publish'] === Vacancy::STATUS_ACTIVE || (int)$params['publish'] === Vacancy::STATUS_ANONYMOUS;
                if ($vacancy->status !== Vacancy::STATUS_ACTIVE && $vacancy->status !== Vacancy::STATUS_ANONYMOUS && $is_publish) {
                    $vacancy->created_at = Carbon::now();
                }
                $vacancy->status = (int)$params['publish'];
            }
            $new_status = $vacancy->status;
            $vacancy->save();
            $vacancy->cities()->sync($params['cities'] ?? []);
            $vacancy->specializations()->sync($params['specializations'] ?? []);
            $vacancy->employment_types()->sync($params['employment_types'] ?? []);
            $vacancy->skills()->sync($params['skills'] ?? []);
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }

        DB::commit();
        if ($is_new && $new_status !== $old_status && $vacancy->status === User::STATUS_ACTIVE) {
            NotificationService::newVacancyNotification($vacancy);
        }
        return $vacancy;
    }

    public static function getOptions(): array
    {
        return [
            'employment_types' => EmploymentType::query()->get(),
            'cities' => City::query()->where('used', 1)->get(),
            'specializations' => SpecializationType::query()->with('items')->get(),
            'experiences' => Experience::query()->get(),
            'english_levels' => EnglishLevel::query()->get(),
            'english_titles' => EnglishLevel::titles(),
            'currencies' => Currency::query()->get(),
            'salaries' => Salary::query()->get(),
            'skills' => Skill::query()->get(),
        ];
    }

    /**
     * Кандидат откликается на вакансию
     *
     * @param $params
     *
     * @return Offer
     */
    public static function createJobApplication($params, CandidateProfile $profile): Offer
    {
        $offer = new Offer();
        $offer->vacancy_id = $params['vacancy_id'];
        $offer->candidate_id = $params['candidate_id'];
        $offer->recruiter_id = $params['recruiter_id'];
        $offer->initiator = Offer::INITIATOR_CANDIDATE;
        $offer->comment = $params['comment'];
        $offer->recruiter_status = Offer::STATUS_NEW;
        $offer->recruiter_expired = Carbon::now()->addDays(7);
        $offer->candidate_status = Offer::STATUS_PROCESSED;
        if ($params['resume_existing'] ?? false) {
            $offer->resume = $profile->resume;
            $offer->resume_name = $profile->resume_name;
        }

        $offer->save();
        if ($params['resume_upload'] ?? false) {
            $offer->uploadResume($params['resume_upload']);
        }


        return $offer;
    }

    /**
     * Рекрутер подтверждаем найм
     *
     * @param Offer $offer
     * @param $released_to_work
     *
     * @return bool
     * @throws Throwable
     *
     */
    public static function confirmOffer(Offer $offer, $released_to_work)
    {
        DB::beginTransaction();

        try {
            $offer->released_to_work = Carbon::parse($released_to_work);
            $offer->recruiter_status = Offer::STATUS_CONFIRMED;
            $offer->recruiter_expired = null;
            $offer->save();

            PayoutService::createIfNotExists($offer);
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }

        DB::commit();

        return true;
    }

    /**
     * Кандидат подтверждает найм
     *
     * @param Offer $offer
     * @param $released_to_work
     *
     * @return bool
     * @throws Throwable
     *
     */
    public static function confirmHiring(Offer $offer, $released_to_work)
    {
        DB::beginTransaction();

        try {
            if ($offer->released_to_work === null) {
                $offer->released_to_work = Carbon::parse($released_to_work);
            }
            $offer->candidate_status = Offer::STATUS_CONFIRMED;
            $offer->candidate_expired = null;
            $offer->save();
            PayoutService::createIfNotExists($offer);
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }

        DB::commit();

        return true;
    }

    /**
     * Рекрутер подтверждает найм с пуш сообщения
     *
     * @param PushQuestion $question
     *
     * @return bool
     * @throws Throwable
     *
     */
    public static function confirmFromPushQuestion(PushQuestion $question)
    {
        DB::beginTransaction();

        try {
            $profile = $question->user->candidate_profile;
            $recruiter = $question->recruiter;

            $offer = $profile->offers()->where('vacancy_id', $question->vacancy_id)->first();
            if ($offer !== null && ($offer->candidate_status === Offer::STATUS_CONFIRMED ||
                    $offer->recruiter_status === Offer::STATUS_CONFIRMED)) {
                return true;
            }

            if ($offer == null) {
                $offer = new Offer();
                $offer->candidate_id = $question->user->id;
                $offer->recruiter_id = $recruiter->id;
                $offer->vacancy_id = $question->vacancy_id;
                $offer->initiator = Offer::INITIATOR_CANDIDATE;
                $offer->recruiter_status = Offer::STATUS_PROCESSED;
                $offer->candidate_status = Offer::STATUS_CONFIRMED;
            }
            if ($offer->released_to_work) {
                $offer->released_to_work = Carbon::now()->addDays(30);
            }

            $offer->candidate_expired = null;
            $offer->recruiter_expired = null;
            $offer->save();

            PayoutService::createIfNotExists($offer);
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());
        }
        DB::commit();

        return true;
    }

    /**
     * Подтверждение найма в чате
     *
     * @param User $candidate
     * @param User $recruiter
     * @param array $params
     *
     * @return string[]
     * @throws Throwable
     *
     */
    public static function confirmFromMessenger(User $candidate, User $recruiter, $params = [])
    {
        DB::beginTransaction();

        try {
            $offer = Offer::where([['candidate_id', $candidate->id], ['recruiter_id', $recruiter->id]])->first();

            if ($offer !== null && ($offer->candidate_status === Offer::STATUS_CONFIRMED ||
                    $offer->recruiter_status === Offer::STATUS_CONFIRMED)) {
                return ['result' => 'error', 'message' => 'Сообщение о найме было отправлено ранее'];
            }

            if ($offer == null) {
                $offer = new Offer();
                $offer->candidate_id = $candidate->id;
                $offer->recruiter_id = $recruiter->id;
                $offer->vacancy_id = $params['vacancy_id'] ?? null;
                $offer->initiator = $params['initiator_id'] == $recruiter->id ? Offer::INITIATOR_RECRUITER : Offer::INITIATOR_CANDIDATE;
            }
            $offer->candidate_status = $params['initiator_id'] == $recruiter->id ? Offer::STATUS_PROCESSED : Offer::STATUS_CONFIRMED;
            $offer->recruiter_status = $params['initiator_id'] == $recruiter->id ? Offer::STATUS_CONFIRMED : Offer::STATUS_PROCESSED;
            $offer->released_to_work = Carbon::parse($params['released_to_work']);
            $offer->candidate_expired = null;
            $offer->recruiter_expired = null;
            $offer->save();

            PayoutService::createIfNotExists($offer);
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return ['result' => 'error', 'message' => 'Ошибка при подтверждении найма'];
        }

        DB::commit();

        return ['result' => 'success', 'message' => ''];
    }

    /**
     * Добавление вакансии в архив
     *
     * @param Vacancy $vacancy
     */
    public static function archive(Vacancy $vacancy)
    {
        $vacancy->status = Vacancy::STATUS_ARCHIVED;
        $vacancy->save();
    }
}
