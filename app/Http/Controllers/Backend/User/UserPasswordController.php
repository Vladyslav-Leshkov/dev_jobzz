<?php

namespace App\Http\Controllers\Backend\User;

use App\Http\Requests\Backend\User\EditUserPasswordRequest;
use App\Http\Requests\Backend\User\UpdateUserPasswordRequest;
use App\Models\Auth\User;

use App\Http\Controllers\Controller;
use App\Services\Backend\Auth\UserService;
use Throwable;

/**
 * Class UserPasswordController.
 */
class UserPasswordController extends Controller
{
    /**
     * @var UserService
     */
    protected $userService;

    /**
     * UserPasswordController constructor.
     *
     * @param  UserService  $userService
     */
    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    /**
     * @param  EditUserPasswordRequest  $request
     * @param  User  $user
     *
     * @return mixed
     */
    public function edit(EditUserPasswordRequest $request, User $user)
    {
        return view('backend.auth.user.change-password')
            ->withUser($user);
    }

    /**
     * @param  UpdateUserPasswordRequest  $request
     * @param  User  $user
     *
     * @throws Throwable
     *
     * @return mixed
     */
    public function update(UpdateUserPasswordRequest $request, User $user)
    {
        $this->userService->updatePassword($user, $request->validated());

        return redirect()->route('admin.user.show', $user)->withFlashSuccess(__('The user\'s password was successfully updated.'));
    }
}
