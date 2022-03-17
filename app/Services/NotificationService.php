<?php

namespace App\Services;

use App\Events\AdminNotificationEvent;
use App\Models\Auth\NotificationLog;
use App\Models\Auth\User;
use App\Models\Common\NotificationItem;
use App\Models\Job\CandidateProfile;
use App\Models\Job\Vacancy;
use App\Models\Messenger\ChatMessage;
use App\Notifications\CandidateJobApplication;
use App\Notifications\CandidateOpenContact;
use App\Notifications\NewCandidateNotification;
use App\Notifications\NewChatMessages;
use App\Notifications\NewVacancyNotification;
use App\Notifications\PushChatMessage;
use App\Notifications\RecruiterJobOffer;
use Exception;
use Illuminate\Support\Facades\Log;

class NotificationService extends BaseService
{
    /**
     * Уведомления об отклике на вакансию
     *
     * @param User $recruiter
     * @param User $candidate
     * @param Vacancy $vacancy
     */
    public static function jobApplicationNotification($recruiter, $candidate, $vacancy)
    {
        try {
            if ($recruiter->notifySettings && $recruiter->notifySettings->notify_application && !$recruiter->is_online) {
                $recruiter->notify(new CandidateJobApplication($candidate, $vacancy));
            }
        } catch (Exception $e) {
            Log::error($e->getMessage(), $e->getTrace());
        }
    }

    /**
     * Уведомления об предложении вакансии
     *
     * @param User $recruiter
     * @param User $candidate
     * @param Vacancy $vacancy
     */
    public static function jobOfferNotification($candidate, $recruiter, $vacancy_id)
    {
        $vacancy = Vacancy::find($vacancy_id);
        if ($vacancy) {
            try {
                if ($candidate->notifySettings && $candidate->notifySettings->notify_application && !$candidate->is_online) {
                    $candidate->notify(new RecruiterJobOffer($recruiter, $vacancy));
                }
            } catch (Exception $e) {
                Log::error($e->getMessage(), $e->getTrace());
            }
        }

    }

    /**
     * Уведомления об открытии контактов кандидатом
     * @param User $recruiter
     * @param User $candidate
     */
    public static function openContactNotification($recruiter, $candidate)
    {
        try {
            if ($recruiter->notifySettings && $recruiter->notifySettings->notify_contacts && !$recruiter->is_online) {
                $recruiter->notify(new CandidateOpenContact($candidate));
            }
        } catch (Exception $e) {
            Log::error($e->getMessage(), $e->getTrace());
        }
    }

    /**
     * Уведомления о новых сообщениях в чате
     *
     * @param User $user
     * @param string $via
     */
    public static function chatNewMessagesNotification($user, $via = 'mail')
    {
        $notificationLog = $user->notificationLogs->where('type', $via === 'telegram'
            ? NotificationLog::TYPE_CHAT_MESSAGE_TELEGRAM
            : NotificationLog::TYPE_CHAT_MESSAGE_MAIL)->first();

        if ($notificationLog === null) {
            $notificationLog = new NotificationLog();
            $notificationLog->notifiable_id = $user->id;
            $notificationLog->notifiable_type = User::class;
            $notificationLog->type = $via === 'telegram' ? NotificationLog::TYPE_CHAT_MESSAGE_TELEGRAM : NotificationLog::TYPE_CHAT_MESSAGE_MAIL;
            $notificationLog->last_id = 0;
        }

        $new_unread = $user->incomingMessages()->where('id', '>', $notificationLog->last_id)->where('seen', 0)->count();
        $count_unread = $user->incomingMessages()->where('seen', 0)->count();

        // Уведомления в телеграм не чаще чем раз в 10 минут, на почту не чаще чем раз в 1 час
        if ($new_unread > 0 && ($notificationLog === null || $notificationLog->updated_at < now()->subMinutes($via === 'telegram' ? 10 : 60))) {
            try {
                $user->notify(new NewChatMessages($count_unread, $via));
                $notificationLog->last_id = $user->incomingMessages()->where('seen', 0)->max('id') ?? 0;
                $notificationLog->save();
            } catch (Exception $e) {
                Log::error($e->getMessage(), $e->getTrace());
            }
        }

    }

    public static function newCandidateNotification(User $candidate)
    {
        $profile = $candidate->candidate_profile()->first();
        $params = $profile->getFilterParams([]);
        $recruiters = User::recruiters()
            ->whereHas('notifySettings', function ($q) {
                return $q->where('notify_candidates', 1)->where(function ($sq) {
                    return $sq->where('email_notify', 1)->orWhere('telegram_notify', 1);
                });
            })
            ->whereHas('vacancies', function ($q) use ($params) {
                return $q->filter($params);
            })->get();

        foreach ($recruiters as $recruiter) {
            try {
                $recruiter->notify(new NewCandidateNotification($candidate));
            } catch (Exception $e) {
                Log::error($e->getMessage(), $e->getTrace());
            }
        }
    }

    /**
     * @param Vacancy $vacancy
     */
    public static function newVacancyNotification(Vacancy $vacancy)
    {
        $params = $vacancy->getFilterParams([]);
        //$candidates = CandidateProfile::active()->filter($params)->with(['user'])->get();
        $candidates = CandidateProfile::active()->filter($params)->whereHas('user.notifySettings', function ($q) {
            return $q->where('notify_vacancies', 1)->where(function ($sq) {
                return $sq->where('email_notify', 1)->orWhere('telegram_notify', 1);
            });
        })->with(['user'])->get();


        foreach ($candidates as $profile) {
            $candidate = $profile->user;

            try {
                $candidate->notify(new NewVacancyNotification($vacancy));
            } catch (Exception $e) {
                Log::error($e->getMessage(), $e->getTrace());
            }
        }
    }

    public static function chatMessageNotification(User $user, ChatMessage $message)
    {
        try {
            $user->notify(new PushChatMessage($message));
        } catch (Exception $e) {
            Log::error($e->getMessage(), $e->getTrace());
        }
    }


    public static function newRegistrationNotify(User $user)
    {

        if ($user->isRecruiter()) {
            $url = route('admin.recruiter.show', $user);
            $data = [
                'type' => 'info',
                'role' => 'admin',
                'icon' => 'user-check',
                'title' => "Зарегистрирован новый рекрутер",
                'message' => "Новый рекрутер <a href='$url'>$user->name</a> требует модерации",
            ];
        } else {
            $url = route('admin.candidate.show', $user);
            $data = [
                'type' => 'info',
                'role' => 'admin',
                'icon' => 'user-check',
                'title' => "Зарегистрирован новый кандидат",
                'message' => "Новый кандидат <a href='$url'>$user->name</a> требует модерации",
            ];
        }
        $notification = NotificationItem::create($data);
        AdminNotificationEvent::dispatch($notification);
    }
}