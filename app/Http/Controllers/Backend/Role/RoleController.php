<?php

namespace App\Http\Controllers\Backend\Role;

use App\Exceptions\GeneralException;
use App\Http\Requests\Backend\Role\DeleteRoleRequest;
use App\Http\Requests\Backend\Role\EditRoleRequest;
use App\Http\Requests\Backend\Role\StoreRoleRequest;
use App\Http\Requests\Backend\Role\UpdateRoleRequest;
use App\Models\Auth\Role;
use App\Services\Backend\Auth\PermissionService;
use App\Services\Backend\Auth\RoleService;
use App\Http\Controllers\Controller;
use Exception;
use Illuminate\Contracts\View\Factory;
use Illuminate\View\View;
use Throwable;

/**
 * Class RoleController.
 */
class RoleController extends Controller
{
    /**
     * @var RoleService
     */
    protected $roleService;

    /**
     * @var PermissionService
     */
    protected $permissionService;

    /**
     * RoleController constructor.
     *
     * @param  RoleService  $roleService
     * @param  PermissionService  $permissionService
     */
    public function __construct(RoleService $roleService, PermissionService $permissionService)
    {
        $this->roleService = $roleService;
        $this->permissionService = $permissionService;
    }

    /**
     * @return Factory|View
     */
    public function index()
    {
        return view('backend.auth.role.index');
    }

    /**
     * @return mixed
     */
    public function create()
    {
        return view('backend.auth.role.create')
            ->withCategories($this->permissionService->getCategorizedPermissions())
            ->withGeneral($this->permissionService->getUncategorizedPermissions());
    }

    /**
     * @param  StoreRoleRequest  $request
     *
     * @throws GeneralException
     * @throws Throwable
     *
     * @return mixed
     */
    public function store(StoreRoleRequest $request)
    {
        $this->roleService->store($request->validated());

        return redirect()->route('admin.role.index')->withFlashSuccess(__('The role was successfully created.'));
    }

    /**
     * @param  EditRoleRequest  $request
     * @param  Role  $role
     *
     * @return mixed
     */
    public function edit(EditRoleRequest $request, Role $role)
    {
        return view('backend.auth.role.edit')
            ->withCategories($this->permissionService->getCategorizedPermissions())
            ->withGeneral($this->permissionService->getUncategorizedPermissions())
            ->withRole($role)
            ->withUsedPermissions($role->permissions->modelKeys());
    }

    /**
     * @param  UpdateRoleRequest  $request
     * @param  Role  $role
     *
     * @throws GeneralException
     * @throws Throwable
     *
     * @return mixed
     */
    public function update(UpdateRoleRequest $request, Role $role)
    {
        $this->roleService->update($role, $request->validated());

        return redirect()->route('admin.role.index')->withFlashSuccess(__('The role was successfully updated.'));
    }

    /**
     * @param  DeleteRoleRequest  $request
     * @param  Role  $role
     *
     * @throws Exception
     *
     * @return mixed
     */
    public function destroy(DeleteRoleRequest $request, Role $role)
    {
        $this->roleService->destroy($role);

        return redirect()->route('admin.role.index')->withFlashSuccess(__('The role was successfully deleted.'));
    }
}
