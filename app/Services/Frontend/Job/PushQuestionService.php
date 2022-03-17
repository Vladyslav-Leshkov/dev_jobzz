<?php

namespace App\Services\Frontend\Job;

use App\Models\Auth\User;
use App\Models\Job\Offer;
use App\Models\Job\Payout;
use App\Models\Job\PushQuestion;
use App\Models\Job\Vacancy;
use App\Services\BaseService;
use Exception;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Throwable;

class PushQuestionService extends BaseService
{

    /**
     * Отправка пуш сообщений кандидатам при закрытии вакансии
     *
     * @param Vacancy $vacancy
     *
     * @throws Throwable
     */
    public static function vacancyClosedCandidates(Vacancy $vacancy)
    {
        /**
         * @var Offer[] $vacancy_candidates
         */
        $vacancy_offers = Offer::query()->where([['initiator', Offer::INITIATOR_CANDIDATE], ['vacancy_id', $vacancy->id]])->with('candidate')->get();

        foreach ($vacancy_offers as $vo) {
            $recruiter = $vacancy->user;
            if ($vo->candidate) {
                $data = [
                    'user_id' => $vo->candidate_id,
                    'vacancy_id' => $vacancy->id,
                    'recruiter_id' => $recruiter ? $recruiter->id : 0,
                    'question' => view('common.push-question.candidate', ['vacancy' => $vacancy, 'recruiter' => $recruiter]),
                    'type' => PushQuestion::TYPE_VACANCY_CANDIDATE,
                    'starts_at' => Carbon::now(),
                ];
                self::createOrUpdate($data);
            }
        }
    }

    /**
     * Создание пуш сообщения
     *
     * @param $data
     *
     * @return PushQuestion|false
     * @throws Throwable
     *
     */
    public static function createOrUpdate($data)
    {
        DB::beginTransaction();

        try {
            $push_question = PushQuestion::query()->where([
                ['user_id', $data['user_id']],
                ['vacancy_id', $data['vacancy_id']],
                ['type', $data['type']],
            ])->first();

            if ($push_question == null) {
                $push_question = new PushQuestion();
            }

            $push_question->fill($data);
            $push_question->save();
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }
        DB::commit();

        return $push_question;
    }

    /**
     * Отправка пуш сообщения рекрутеру при автоматическом закрытии вакансии
     *
     * @param Vacancy $vacancy
     *
     * @throws Throwable
     */
    public static function vacancyClosedRecruiter(Vacancy $vacancy)
    {
        $recruiter = $vacancy->user;
        $data = [
            'user_id' => $recruiter ? $recruiter->id : 0,
            'vacancy_id' => $vacancy->id,
            'recruiter_id' => null,
            'question' => view('common.push-question.recruiter', ['vacancy' => $vacancy]),
            'type' => PushQuestion::TYPE_VACANCY_RECRUITER,
            'starts_at' => Carbon::now(),
        ];
        self::createOrUpdate($data);
    }

    /**
     * Пользователь ответил на вопрос
     *
     * @param PushQuestion $question
     * @param string $answer
     *
     * @return array
     * @throws Throwable
     *
     */
    public static function answerResponse(PushQuestion $question, string $answer)
    {
        if ($question->type === PushQuestion::TYPE_VACANCY_RECRUITER) {
            return self::vacancyRecruiterAnswerResponse($question, $answer);
        }

        if ($question->type === PushQuestion::TYPE_VACANCY_CANDIDATE) {
            return self::vacancyCandidateAnswerResponse($question, $answer);
        }

        if ($question->type === PushQuestion::TYPE_ACQUAINTANCE) {
            return self::acquaintanceAnswerResponse($question, $answer);
        }

        return ['result' => 'error', 'message' => __('Unknown answer')];
    }

    /**
     * Ответ рекрутера после закрытия вакансии
     *
     * @param PushQuestion $question
     * @param string $answer
     *
     * @return array
     */
    public static function vacancyRecruiterAnswerResponse(PushQuestion $question, string $answer)
    {
        $question->answer = $answer;

        switch ($answer) {
            case PushQuestion::ANSWER_STILL:
                $question->save();
                $vacancy = $question->vacancy;
                $vacancy->created_at = Carbon::now();
                $vacancy->status = Vacancy::STATUS_ACTIVE;
                $vacancy->save();

                return ['result' => 'success', 'message' => __('Thanks for your reply. Your vacancy has been published for 30 days.')];
            case PushQuestion::ANSWER_NO:
                $question->save();

                return ['result' => 'success', 'message' => __('Thanks for your reply.')];
            case PushQuestion::ANSWER_YES:
                $question->save();
                $vacancy = $question->vacancy;
                $redirect_url = route('frontend.profile.vacancy.candidates', $vacancy);

                return ['result' => 'success', 'message' => __('Thanks for your reply.'), 'redirect_url' => $redirect_url];
            default:
                return ['result' => 'error', 'message' => __('Unknown answer')];
        }
    }

    /**
     * Ответ кандидата после закрытия вакансии
     *
     * @param PushQuestion $question
     * @param string $answer
     *
     * @return array
     * @throws Throwable
     *
     */
    public static function vacancyCandidateAnswerResponse(PushQuestion $question, string $answer)
    {
        switch ($answer) {
            case PushQuestion::ANSWER_STILL:
                $question->starts_at = Carbon::now()->addDays(7);
                $question->save();

                return ['result' => 'success', 'message' => __('Thanks for your reply.')];
            case PushQuestion::ANSWER_NO:
                $question->answer = $answer;
                $question->save();

                return ['result' => 'success', 'message' => __('Thanks for your reply.')];
            case PushQuestion::ANSWER_YES:
                $question->answer = $answer;
                $question->save();
                VacancyService::confirmFromPushQuestion($question);

                return ['result' => 'success', 'message' => __('Thanks for your reply.')];
            default:
                return ['result' => 'error', 'message' => __('Unknown answer')];
        }
    }

    /**
     * Ответ кандидата на вопрос о знакомстве
     *
     * @param PushQuestion $question
     * @param string $answer
     *
     * @return array
     */
    public static function acquaintanceAnswerResponse(PushQuestion $question, string $answer)
    {
        switch ($answer) {
            case PushQuestion::ANSWER_NO:
                $question->answer = $answer;
                $question->starts_at = Carbon::now()->addDays(3);
                $question->save();

                return ['result' => 'success', 'message' => __('Thanks for your reply.')];
            case PushQuestion::ANSWER_YES:
                $question->answer = $answer;
                $question->save();
                $redirect_url = route('frontend.recruiter.confirm');

                return ['result' => 'success', 'message' => __('Thanks for your reply.'), 'redirect_url' => $redirect_url];
            default:
                return ['result' => 'error', 'message' => __('Unknown answer')];
        }
    }

    /**
     * Вопрос о найме кандидату после знакомства
     *
     * @param User $candidate
     *
     * @throws Throwable
     */
    public static function acquaintanceQuestion(User $candidate)
    {
        $recruiter_ids = Payout::where('candidate_id', $candidate->id)->select('recruiter_id')->pluck('recruiter_id')->toArray();
        $count = $candidate->openDatas()->whereNotIn('recruiter_id', $recruiter_ids)->whereDate('created_at', '<=', Carbon::now()->subDays(3))->count();

        if ($count > 0) {
            $data = [
                'user_id' => $candidate->id,
                'vacancy_id' => null,
                'recruiter_id' => null,
                'question' => view('common.push-question.acquaintance', ['count' => $count]),
                'type' => PushQuestion::TYPE_ACQUAINTANCE,
                'starts_at' => Carbon::now(),
            ];
            self::createOrUpdate($data);
        }
    }
}
