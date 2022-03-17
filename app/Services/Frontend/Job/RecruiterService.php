<?php

namespace App\Services\Frontend\Job;

use App\Events\AdminNotificationEvent;
use App\Events\NewRecruiterRegistration;
use App\Models\Auth\User;
use App\Models\Common\NotificationItem;
use App\Models\Job\Company;
use App\Models\Job\CompanyUser;
use App\Models\Job\NotifySettings;
use App\Services\BaseService;
use App\Services\NotificationService;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class RecruiterService extends BaseService
{
    /**
     * Редактирование профиля рекрутера
     *
     * @param User $user
     * @param Request $request
     *
     * @throws \Throwable
     *
     * @return Company|false
     */
    public static function createOrUpdateProfile(User $user, Request $request)
    {
        $params = $request->all();
        $company = $user->company;

        if ($company === null) {
            $company = new Company();
            $company->moderated = site_option('moderate_recruiter') ? 0 : 1;
            $company->ref = Str::random(8);
            $company->status = Company::STATUS_NEW;
        }

        DB::beginTransaction();

        try {
            $company->fill($request->only([
                'title',
                'description',
                'website',
                'address',
                'is_product',
            ]));

            if (isset($params['publish'])) {
                $company->status = (int)$params['publish'] === 1 ? Company::STATUS_ACTIVE : Company::STATUS_INACTIVE;
            }

            $company->save();

            if ($request->hasFile('logo_upload')) {
                $cropData = !empty($params['logo_upload_crop']) ? json_decode($params['logo_upload_crop'], true) : null;
                $company->uploadLogo($params['logo_upload'], $cropData);
            }

            $user->fill($request->only([
                'first_name',
                'last_name',
                'linked_in',
                'telegram',
                'position',
                'phone',
                'email',
            ]));


            if ($user->status === User::STATUS_INACTIVE) {
                $user->status = site_option('moderate_recruiter') ? User::STATUS_MODERATE : User::STATUS_ACTIVE;
            }

            $user->save();
            if ($request->hasFile('avatar_upload')) {
                $cropData = !empty($params['avatar_upload_crop']) ? json_decode($params['avatar_upload_crop'], true) : null;
                $user->uploadAvatar($params['avatar_upload'], $cropData);
            }

            $user->companies()->sync([$company->id]);
            $user->companies()->updateExistingPivot($company->id, [
                'is_admin' => true,
                'status' => CompanyUser::STATUS_ACTIVE,
            ]);

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
            NewRecruiterRegistration::dispatch();
        }

        return $company;
    }
}
