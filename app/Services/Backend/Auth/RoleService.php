<?php

namespace App\Services\Backend\Auth;

use App\Models\Auth\Role;
use App\Exceptions\GeneralException;
use App\Services\BaseService;
use Exception;
use Illuminate\Support\Facades\DB;
use Throwable;

/**
 * Class RoleService.
 */
class RoleService extends BaseService
{
    /**
     * RoleService constructor.
     *
     * @param  Role  $role
     */
    public function __construct(Role $role)
    {
        $this->model = $role;
    }

    /**
     * @param  array  $data
     *
     * @throws GeneralException
     * @throws Throwable
     *
     * @return Role
     */
    public function store(array $data = []): Role
    {
        DB::beginTransaction();

        try {
            $role = $this->model::create(['type' => $data['type'], 'name' => $data['name']]);
            $role->syncPermissions($data['permissions'] ?? []);
        } catch (Exception $e) {
            DB::rollBack();

            throw new GeneralException(__('There was a problem creating the role.'));
        }

        //event(new RoleCreated($role));

        DB::commit();

        return $role;
    }

    /**
     * @param  Role  $role
     * @param  array  $data
     *
     * @throws GeneralException
     * @throws Throwable
     *
     * @return Role
     */
    public function update(Role $role, array $data = []): Role
    {
        DB::beginTransaction();

        try {
            $role->update(['type' => $data['type'], 'name' => $data['name']]);
            $role->syncPermissions($data['permissions'] ?? []);
        } catch (Exception $e) {
            DB::rollBack();

            throw new GeneralException(__('There was a problem updating the role.'));
        }

        //event(new RoleUpdated($role));

        DB::commit();

        return $role;
    }

    /**
     * @param  Role  $role
     *
     * @throws GeneralException
     *
     * @return bool
     */
    public function destroy(Role $role): bool
    {
        if ($role->users()->count()) {
            throw new GeneralException(__('You can not delete a role with associated users.'));
        }

        if ($this->deleteById($role->id)) {
            //event(new RoleDeleted($role));

            return true;
        }

        throw new GeneralException(__('There was a problem deleting the role.'));
    }
}
