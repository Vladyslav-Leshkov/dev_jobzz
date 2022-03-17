<?php

namespace App\Http\Controllers\Backend\User;

use App\Exceptions\GeneralException;
use App\Models\Auth\User;
use App\Services\Backend\Auth\UserService;
use App\Http\Controllers\Controller;
use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\View\View;

/**
 * Class DeletedUserController.
 */
class DeletedUserController extends Controller
{
    /**
     * @var UserService
     */
    protected $userService;

    /**
     * DeletedUserController constructor.
     *
     * @param  UserService  $userService
     */
    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    /**
     * @return Application|Factory|View
     */
    public function index()
    {
        return view('backend.auth.user.deleted');
    }

    /**
     * @param  User  $deletedUser
     *
     * @throws GeneralException
     *
     * @return mixed
     */
    public function update(User $deletedUser)
    {
        $this->userService->restore($deletedUser);

        return redirect()->route('admin.user.index')->withFlashSuccess(__('The user was successfully restored.'));
    }

    /**
     * @param  User  $deletedUser
     *
     * @throws GeneralException
     *
     * @return mixed
     */
    public function destroy(User $deletedUser)
    {
        abort_unless(config('site-settings.user.permanently_delete'), 404);

        $this->userService->destroy($deletedUser);

        return redirect()->route('admin.user.deleted')->withFlashSuccess(__('The user was permanently deleted.'));
    }
}
