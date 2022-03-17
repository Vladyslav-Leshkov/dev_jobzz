<?php

namespace App\Http\Controllers\Backend\User;

use App\Exceptions\GeneralException;
use App\Http\Requests\Backend\User\DeleteUserRequest;
use App\Http\Requests\Backend\User\EditUserRequest;
use App\Http\Requests\Backend\User\StoreUserRequest;
use App\Http\Requests\Backend\User\UpdateUserRequest;
use App\Models\Auth\User;
use App\Services\Backend\Auth\PermissionService;
use App\Services\Backend\Auth\RoleService;
use App\Services\Backend\Auth\UserService;
use App\Http\Controllers\Controller;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Throwable;

/**
 * Class UserController.
 */
class UserController extends Controller
{
    /**
     * @var UserService
     */
    protected $userService;

    /**
     * @var RoleService
     */
    protected $roleService;

    /**
     * @var PermissionService
     */
    protected $permissionService;

    /**
     * UserController constructor.
     *
     * @param  UserService  $userService
     * @param  RoleService  $roleService
     * @param  PermissionService  $permissionService
     */
    public function __construct(UserService $userService, RoleService $roleService, PermissionService $permissionService)
    {
        $this->userService = $userService;
        $this->roleService = $roleService;
        $this->permissionService = $permissionService;
    }

    /**
     * @return View
     */
    public function index(Request $request, string $status = 'active')
    {
        return view('backend.auth.user.index', ['status'=>$status]);
    }

    /**
     * @return mixed
     */
    public function create()
    {
        return view('backend.auth.user.create')
            ->withRoles($this->roleService->get())
            ->withCategories($this->permissionService->getCategorizedPermissions())
            ->withGeneral($this->permissionService->getUncategorizedPermissions());
    }

    /**
     * @param  StoreUserRequest  $request
     *
     * @throws GeneralException
     * @throws Throwable
     *
     * @return mixed
     */
    public function store(StoreUserRequest $request)
    {
        $user = $this->userService->store($request->validated());

        return redirect()->route('admin.user.show', $user)->withFlashSuccess(__('The user was successfully created.'));
    }

    /**
     * @param  User  $user
     *
     * @return mixed
     */
    public function show(User $user)
    {
        return view('backend.auth.user.show')
            ->withUser($user);
    }

    /**
     * @param  EditUserRequest  $request
     * @param  User  $user
     *
     * @return mixed
     */
    public function edit(EditUserRequest $request, User $user)
    {
        return view('backend.auth.user.edit')
            ->withUser($user)
            ->withRoles($this->roleService->get())
            ->withCategories($this->permissionService->getCategorizedPermissions())
            ->withGeneral($this->permissionService->getUncategorizedPermissions())
            ->withUsedPermissions($user->permissions->modelKeys());
    }

    /**
     * @param  UpdateUserRequest  $request
     * @param  User  $user
     *
     * @throws Throwable
     *
     * @return mixed
     */
    public function update(UpdateUserRequest $request, User $user)
    {
        $this->userService->update($user, $request->validated());

        return redirect()->route('admin.user.show', $user)->withFlashSuccess(__('The user was successfully updated.'));
    }

    /**
     * @param  DeleteUserRequest  $request
     * @param  User  $user
     *
     * @throws GeneralException
     *
     * @return mixed
     */
    public function destroy(DeleteUserRequest $request, User $user)
    {
        $this->userService->delete($user);

        return redirect()->route('admin.user.index')->withFlashSuccess(__('The user was successfully deleted.'));
    }

    public function restore(Request $request, int $id)
    {
        $user = User::onlyTrashed()->findOrFail($id);
        $this->userService->restore($user);

        return redirect()->route('admin.user.index')->withFlashSuccess(__('The user was successfully restored.'));
    }

    /**
     * @param  Request  $request
     * @param  int  $id
     *
     * @throws GeneralException
     *
     * @return mixed
     */
    public function forceDelete(Request $request, int $id)
    {
        $user = User::onlyTrashed()->findOrFail($id);
        if ($user->isMasterAdmin()) {
            throw new AuthorizationException(__('You can not delete the master administrator.'));
        }
        $this->userService->destroy($user);

        return redirect()->route('admin.user.index')->withFlashSuccess(__('The user was successfully deleted.'));
    }
}
