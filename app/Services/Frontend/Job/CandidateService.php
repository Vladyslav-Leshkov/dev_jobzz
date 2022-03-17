<?php

namespace App\Services\Frontend\Job;

use App\Events\NewCandidateRegistration;
use App\Events\NewRecruiterRegistration;
use App\Models\Auth\User;
use App\Models\Job\CandidateOpenData;
use App\Models\Job\CandidateProfile;
use App\Models\Job\NotifySettings;
use App\Models\Job\Offer;
use App\Models\Job\Skill;
use App\Services\BaseService;
use App\Services\NotificationService;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Throwable;

class CandidateService extends BaseService
{
    /**
     * Редактирование профиля кандидата
     *
     * @param User $user
     * @param Request $request
     *
     * @return CandidateProfile|false|null
     * @throws Throwable
     *
     */
    public static function createOrUpdateProfile(User $user, Request $request)
    {
        $params = $request->all();
        $profile = $user->candidate_profile;
        $status_changed = false;
        $is_new = false;
        $old_status = $user->status;
        $new_status = $user->status;

        if ($profile === null) {
            $profile = new CandidateProfile();
            $profile->user_id = $user->id;
            $profile->moderated = site_option('moderate_candidate') ? 0 : 1;
        }

        DB::beginTransaction();

        try {
            $profile->fill($params);
            if (isset($params['publish'])) {
                $new_status = (int)$params['publish'];
                $profile->status = $new_status;
                $user->status = $new_status;
                $status_changed = $old_status !== $new_status;
            }
            if ($old_status === User::STATUS_INACTIVE) {
                $is_new = true;
            }
            if ($status_changed && $new_status == User::STATUS_ACTIVE) {
                $profile->created_at = Carbon::now();
            }

            $profile->save();
            $profile->employment_types()->sync($params['employment_types'] ?? []);
            $profile->cities()->sync($params['cities'] ?? []);
            $profile->specializations()->sync($params['specializations'] ?? []);
            $profile->skills()->sync([]);

            if (isset($params['skills'])) {
                foreach (array_unique($params['skills']) as $position => $skill) {
                    $skill = Skill::findByTitle($skill, true);
                    if ($skill) {
                        $profile->skills()->attach($skill->id, ['main' => 1, 'position' => $position]);
                    }
                }
            } else {
                $params['skills'] = [];
            }

            if (isset($params['additional_skills'])) {
                foreach (array_diff(array_unique($params['additional_skills']), $params['skills']) as $position => $skill) {
                    $skill = Skill::findByTitle($skill, true);
                    if ($skill) {
                        $profile->skills()->attach($skill->id, ['main' => 0, 'position' => $position]);
                    }
                }
            }

            if ($request->hasFile('resume_upload')) {
                $profile->uploadResume($params['resume_upload']);
            }

            $user->fill($request->only(['first_name', 'last_name', 'linked_in', 'position']));

            $user->save();

            if ($request->hasFile('avatar_upload')) {
                $cropData = !empty($params['avatar_upload_crop']) ? json_decode($params['avatar_upload_crop'], true) : null;
                $user->uploadAvatar($params['avatar_upload'], $cropData);
            }

            if (empty($user->notifySettings)) {
                $notifySettings = new NotifySettings();
                $notifySettings->user_id = $user->id;
                $notifySettings->email_notify = true;
                $notifySettings->push_notify = true;
                $notifySettings->notify_contacts = true;
                $notifySettings->notify_message = true;
                $notifySettings->notify_application = true;
                $notifySettings->notify_candidates = true;
                $notifySettings->notify_vacancies = true;
                $notifySettings->notify_news = true;
                $notifySettings->save();
            }
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }

        DB::commit();
        if ($user->status === User::STATUS_MODERATE) {
            NotificationService::newRegistrationNotify($user);
            NewCandidateRegistration::dispatch();
        }
        if ($is_new && $status_changed && $user->status === User::STATUS_ACTIVE) {
            NotificationService::newCandidateNotification($user);
        }
        return $profile;
    }

    /**
     * Редактирование контактной информации кандидата
     *
     * @param User $user
     * @param array $params
     *
     * @return User|false
     * @throws Throwable
     *
     */
    public static function updateContacts(User $user, array $params)
    {
        DB::beginTransaction();
        $emailChanged = false;

        try {
            $profile = $user->candidate_profile;


            if (isset($params['status'])) {
                $old_status = $user->status;
                $new_status = (int)$params['status'];
                $profile->status = $new_status;
                if ($old_status !== $new_status && $new_status === User::STATUS_ACTIVE) {
                    $profile->created_at = Carbon::now();
                    $profile->save();
                }
            }
            if (isset($params['email']) && $user->email !== $params['email']) {
                $emailChanged = true;
            }

            $user->fill($params);
            $user->save();


            if (isset($params['avatar_upload'])) {
                $cropData = !empty($params['avatar_upload_crop']) ? json_decode($params['avatar_upload_crop'], true) : null;
                $user->uploadAvatar($params['avatar_upload'], $cropData);
            }

            if (array_key_exists('resume', $params) && empty($params['resume'])) {
                $profile->resume = '';
                $profile->resume_name = '';
                $profile->save();
            }

            if (isset($params['resume_upload'])) {
                $profile->uploadResume($params['resume_upload']);
            }
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }

        DB::commit();

        if ($emailChanged) {
            $user->email_verified_at = null;
            $user->save();
            $user->sendEmailVerificationNotification();

        }

        return $user;
    }

    public static function setProfileStatus(User $user, $status)
    {
        $old_status = $user->status;
        $new_status = (int)$status;

        $profile = $user->candidate_profile;

        // обновляет статус юзера
        $profile->status = $status;
        // Обновляем статус при публикации
        if ($old_status !== $new_status && $new_status === User::STATUS_ACTIVE) {
            $profile->created_at = Carbon::now();
            $profile->save();
        }
    }

    public static function createVacancyOffer(array $params): Offer
    {
        $candidate_vacancy = new Offer();
        $candidate_vacancy->vacancy_id = $params['vacancy_id'];
        $candidate_vacancy->candidate_id = $params['candidate_id'];
        $candidate_vacancy->recruiter_id = $params['recruiter_id'];
        $candidate_vacancy->initiator = Offer::INITIATOR_RECRUITER;
        $candidate_vacancy->comment = $params['comment'];
        $candidate_vacancy->candidate_status = Offer::STATUS_NEW;
        $candidate_vacancy->candidate_expired = Carbon::now()->addDays(7);
        $candidate_vacancy->recruiter_status = Offer::STATUS_PROCESSED;
        $candidate_vacancy->save();

        return $candidate_vacancy;
    }

    public static function vacancyOfferIds($candidate_id, $recruiter_id = 0): array
    {
        $query = Offer::query()->where('candidate_id', $candidate_id);
        if ($recruiter_id > 0) {
            $query->where('recruiter_id', $recruiter_id);
        }

        return $query->get(['vacancy_id'])->pluck('vacancy_id')->toArray();
    }

    public static function openData($candidate_id, $recruiter_id, $data = null)
    {
        $open_data = CandidateOpenData::query()
            ->where('candidate_id', $candidate_id)
            ->where('recruiter_id', $recruiter_id)->first();

        if (empty($open_data)) {
            $open_data = new CandidateOpenData();
            $open_data->candidate_id = $candidate_id;
            $open_data->recruiter_id = $recruiter_id;
        }
        $open_data->data = $data;
        $open_data->save();

        return $open_data;
    }
}
