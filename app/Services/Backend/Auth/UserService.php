<?php

namespace App\Services\Backend\Auth;

use App\Events\User\UserCreated;
use App\Events\User\UserDeleted;
use App\Events\User\UserDestroyed;
use App\Events\User\UserRestored;
use App\Events\User\UserStatusChanged;
use App\Events\User\UserUpdated;
use App\Models\Auth\Role;
use App\Models\Auth\User;
use App\Exceptions\GeneralException;
use App\Models\Job\CandidateOpenData;
use App\Models\Job\Offer;
use App\Models\Job\Vacancy;
use App\Services\BaseService;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Throwable;
use Laravel\Socialite\Contracts\User as SocialiteUser;

/**
 * Class UserService.
 */
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
     * @param $type
     * @param bool|int $perPage
     *
     * @return mixed
     */
    public function getByType($type, $perPage = false)
    {
        if (is_numeric($perPage)) {
            return $this->model::byType($type)->paginate($perPage);
        }

        return $this->model::byType($type)->get();
    }

    /**
     * @param array $data
     *
     * @return mixed
     * @throws GeneralException
     *
     */
    public function registerUser(array $data = []): User
    {
        DB::beginTransaction();

        try {
            $user = $this->createUser($data);
        } catch (Exception $e) {
            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());
            throw new GeneralException(__('There was a problem creating your account.'));
        }

        DB::commit();

        return $user;
    }

    /**
     * @param SocialiteUser|mixed $info
     * @param $provider
     *
     * @return mixed
     * @throws GeneralException
     *
     */
    public function registerProvider($info, $provider, $role = null): User
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
                $user_data = $this->getUserProviderData($provider, $info);
                $user_data['type'] = $role;
                $user = $this->createUser($user_data);

                if (!empty($role)) {
                    $user->assignRole($role);
                } else {
                    $user->assignRole('candidate');
                }
                $user->markEmailAsVerified();

            } catch (Exception $e) {
                DB::rollBack();
                Log::error($e->getMessage());
                throw new GeneralException(__('There was a problem connecting to :provider', ['provider' => $provider]));
            }

            DB::commit();
        }

        return $user;
    }

    /**
     * @param SocialiteUser|mixed $info
     * @return User|\Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Eloquent\Model|object|null
     */
    public function userProviderExist($info, $provider)
    {
        $email = $info->getEmail();

        $query = $this->model::query()->where(function ($q) use ($info, $provider) {
            $q->where('provider_id', $info->id)->where('provider', $provider);
        });

        if (!empty($email)) {
            $query->orWhere('email', $info->getEmail());
        }

        return $query->first();
    }

    private function getUserProviderData($provider, $info)
    {
        $name = array_filter(explode(' ', $info->name));
        return [
            'type' => null,
            'email' => $info->email,
            'first_name' => count($name) > 0 ? trim($name[0]) : '',
            'last_name' => count($name) > 1 ? trim($name[1]) : '',
            'password' => bcrypt(Str::random(8)),
            'avatar' => $info->avatar,
            'provider' => $provider,
            'provider_id' => $info->id,
            'status' => User::STATUS_INACTIVE,
            'email_verified_at' => now()
        ];
    }

    /**
     * @param array $data
     *
     * @return User
     * @throws Throwable
     *
     * @throws GeneralException
     */
    public function store(array $data = []): User
    {
        DB::beginTransaction();

        try {
            $user = $this->createUser([
                'type' => $data['type'],
                'login' => $data['login'] ?? '',
                'phone' => $data['phone'] ?? '',
                'first_name' => $data['first_name'] ?? '',
                'last_name' => $data['last_name'] ?? '',
                'gender' => $data['gender'] ?? '',
                'date_of_birth' => $data['date_of_birth'] ?? '',
                'avatar' => $data['avatar'] ?? '',
                'email' => $data['email'],
                'company' => $data['company'] ?? '',
                'website' => $data['website'] ?? '',
                'password' => $data['password'] ?? '',
                'email_verified_at' => isset($data['email_verified']) && $data['email_verified'] === '1' ? now() : null,
                'active' => isset($data['active']) && $data['active'] === '1',
            ]);

            if (!empty($data['avatar_upload'])) {
                $user->uploadAvatar($data['avatar_upload']);
            }

            if (empty($data['roles'])) {
                $data['roles'] = Role::findByType($data['type']);
            }

            $user->syncRoles($data['roles'] ?? []);

            if (!config('site-settings.user.only_roles')) {
                $user->syncPermissions($data['permissions'] ?? []);
            }
        } catch (Exception $e) {

            DB::rollBack();
            Log::error($e->getMessage(), $e->getTrace());
            throw new GeneralException(__('There was a problem creating this user. Please try again.'));
        }

        event(new UserCreated($user));

        DB::commit();

        // They didn't want to auto verify the email, but do they want to send the confirmation email to do so?
        if (!isset($data['email_verified']) && isset($data['send_confirmation_email']) && $data['send_confirmation_email'] === '1') {
            $user->sendEmailVerificationNotification();
        }

        return $user;
    }

    /**
     * @param User $user
     * @param array $data
     *
     * @return User
     * @throws Throwable
     *
     */
    public function update(User $user, array $data = []): User
    {
        DB::beginTransaction();

        try {
            if (empty($data['avatar']) && !empty($user->avatar)) {
                $user->deleteAvatar();
            }

            $user->update([
                'type' => $user->isMasterAdmin() ? $this->model::TYPE_ADMIN : $data['type'] ?? $user->type,
                'login' => $data['login'] ?? '',
                'avatar' => $data['avatar'] ?? '',
                'email' => $data['email'],
                'phone' => $data['phone'] ?? '',
                'first_name' => $data['first_name'] ?? '',
                'last_name' => $data['last_name'] ?? '',
                'gender' => $data['gender'] ?? '',
                'date_of_birth' => $data['date_of_birth'] ?? '',
                'company' => $data['company'] ?? '',
                'website' => $data['website'] ?? '',
            ]);

            if (!empty($data['avatar_upload'])) {
                $user->uploadAvatar($data['avatar_upload']);
            }

            if (!$user->isMasterAdmin()) {
                // Replace selected roles/permissions
                if (empty($data['roles'])) {
                    $data['roles'] = Role::findByType($data['type']);
                }

                $user->syncRoles($data['roles'] ?? []);

                if (!config('site-settings.user.only_roles')) {
                    $user->syncPermissions($data['permissions'] ?? []);
                }
            }
        } catch (Exception $e) {
            DB::rollBack();

            throw new GeneralException(__('There was a problem updating this user. Please try again.'));
        }

        event(new UserUpdated($user));

        DB::commit();

        return $user;
    }

    /**
     * @param User $user
     * @param array $data
     *
     * @return User
     */
    public function updateProfile(User $user, array $data = []): User
    {
        // $user->login = $data['login'] ?? null;

        if ($user->canChangeEmail() && $user->email !== $data['email']) {
            $user->email = $data['email'];
            $user->email_verified_at = null;
            $user->sendEmailVerificationNotification();
            session()->flash('resent', true);
        }

        return tap($user)->save();
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

    /**
     * @param User $user
     * @param $status
     *
     * @return User
     * @throws GeneralException
     *
     */
    public function mark(User $user, $status): User
    {
        if ($status === User::STATUS_INACTIVE && auth()->id() === $user->id) {
            throw new GeneralException(__('You can not do that to yourself.'));
        }

        if ($status === User::STATUS_INACTIVE && $user->isMasterAdmin()) {
            throw new GeneralException(__('You can not deactivate the administrator account.'));
        }

        $user->status = $status;

        if ($user->save()) {
            event(new UserStatusChanged($user, $status));

            return $user;
        }

        throw new GeneralException(__('There was a problem updating this user. Please try again.'));
    }

    /**
     * @param User $user
     *
     * @return User
     * @throws GeneralException
     *
     */
    public function delete(User $user): User
    {
        if ($user->id === auth()->id()) {
            throw new GeneralException(__('You can not delete yourself.'));
        }

        try {

            CandidateOpenData::where('recruiter_id', $user->id)->orWhere('candidate_id', $user->id)->delete();
            Offer::where('recruiter_id', $user->id)->orWhere('candidate_id', $user->id)->delete();
            Vacancy::where('user_id', $user->id)->delete();

            if ($user->isCandidate()) {
                $user->loadMissing('candidate_profile');
                if ($user->candidate_profile && !empty($user->candidate_profile->resume)) {
                    $user->candidate_profile->deleteResume();
                }
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
            event(new UserDeleted($user));
            return $user;
        } catch (Exception $e) {
            Log::error($e->getMessage(), $e->getTrace());
            throw new GeneralException('There was a problem deleting this user. Please try again.');
        }

    }

    /**
     * @param User $user
     *
     * @return User
     * @throws GeneralException
     *
     */
    public function restore(User $user): User
    {
        if ($user->restore()) {
            event(new UserRestored($user));

            return $user;
        }

        throw new GeneralException(__('There was a problem restoring this user. Please try again.'));
    }

    /**
     * @param User $user
     *
     * @return bool
     * @throws GeneralException
     *
     */
    public function destroy(User $user): bool
    {

        if ($user->forceDelete()) {
            event(new UserDestroyed($user));

            return true;
        }

        throw new GeneralException(__('There was a problem permanently deleting this user. Please try again.'));
    }

    /**
     * @param array $data
     *
     * @return User
     */
    protected function createUser(array $data = []): User
    {
        return $this->model::create([
            'type' => $data['type'] ?? null,
            'login' => $data['login'] ?? null,
            'email' => $data['email'] ?? null,
            'phone' => $data['phone'] ?? null,
            'password' => $data['password'] ?? null,
            'first_name' => $data['first_name'] ?? null,
            'last_name' => $data['last_name'] ?? null,
            'avatar' => $data['avatar'] ?? null,
            'gender' => $data['gender'] ?? null,
            'email_verified_at' => $data['email_verified_at'] ?? null,
            'status' => $data['status'] ?? 0,
            'provider' => $data['provider'] ?? null,
            'provider_id' => $data['provider_id'] ?? null,
        ]);
    }
}
