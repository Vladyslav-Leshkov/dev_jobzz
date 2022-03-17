<?php

namespace App\Services\Frontend\Auth;

use App\Exceptions\GeneralException;
use App\Models\Auth\User;
use App\Services\BaseService;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Throwable;

class UserService extends BaseService
{
    /**
     * UserService constructor.
     *
     * @param User $user
     */
    public function __construct(User $user)
    {
        $this->model = $user;
    }

    /**
     * Удаление профиля пользователя и связанных данных
     * @param User $user
     * @return bool
     */
    public static function deleteAccount(User $user)
    {
        try {
            $user->loadMissing('candidate_profile');
            if ($user->candidate_profile && !empty($user->candidate_profile->resume)) {
                $user->candidate_profile->deleteResume();
            }
            $user->allChatMessages()->delete();
            $user->deleteAvatar();
            $user->email = "deleted_{$user->id}@jobzz.ru";
            $user->provider = null;
            $user->provider_id = null;
            $user->first_name = 'User';
            $user->last_name = 'Deleted';
            $user->save();

            $user->delete();

            return true;
        } catch (Exception $e) {
            Log::error($e->getMessage(), $e->getTrace());

            return false;
        }
    }

    /**
     * Регистрация пользователя с помощью соцсетей
     *
     * @param $info
     * @param $provider
     *
     * @return mixed
     * @throws GeneralException
     *
     */
    public function registerProvider($info, $provider): User
    {
        $email = $info->getEmail();

        $query = $this->model::query()->where(function ($q) use ($info, $provider) {
            $q->where('provider_id', $info->id)->where('provider', $provider);
        });

        if (!empty($email)) {
            $query->orWhere('email', $info->getEmail());
        }

        $user = $query->first();

        if (!$user) {
            DB::beginTransaction();

            try {
                $user = $this->model::create([
                    'first_name' => $info->name,
                    'email' => $info->email,
                    'provider' => $provider,
                    'provider_id' => $info->id,
                    'email_verified_at' => now(),
                ]);
            } catch (Exception $e) {
                Log::error($e->getMessage(), $e->getTrace());
                DB::rollBack();

                throw new GeneralException(__('There was a problem connecting to :provider', ['provider' => $provider]));
            }

            DB::commit();
        }

        return $user;
    }

    /**
     * @param User $user
     * @param $data
     * @param bool $expired
     *
     * @return User
     * @throws Throwable
     *
     */
    public function updatePassword(User $user, $data, $expired = false): User
    {
        if (isset($data['current_password'])) {
            throw_if(
                !Hash::check($data['current_password'], $user->password),
                new GeneralException(__('That is not your old password.'))
            );
        }

        // Reset the expiration clock
        if ($expired) {
            $user->password_changed_at = now();
        }

        $user->password = $data['password'];

        return tap($user)->update();
    }
}
