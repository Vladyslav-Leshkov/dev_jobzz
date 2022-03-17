<?php

namespace Database\Seeders\Auth;

use App\Models\Auth\Role;
use App\Models\Auth\User;
use Database\Seeders\Traits\DisableForeignKeys;
use Illuminate\Database\Seeder;

/**
 * Class UserRoleTableSeeder.
 */
class UserRoleSeeder extends Seeder
{
    use DisableForeignKeys;

    /**
     * Run the database seed.
     */
    public function run()
    {
        $this->disableForeignKeys();

        /**
         * @var User $user
         * @var Role $adminRole
         */
        $user = User::find(1);
        $role = Role::findByType(User::TYPE_ADMIN);

        $user->assignRole($role);

        if (app()->environment(['local', 'testing'])) {

            $user = User::find(2);
            $role = Role::findByType(User::TYPE_SUPPORT);
            $user->assignRole($role);

        }

        $this->enableForeignKeys();
    }
}
