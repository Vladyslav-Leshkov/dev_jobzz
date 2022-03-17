<?php

namespace Database\Seeders\Auth;

use App\Models\Auth\User;
use Database\Seeders\Traits\DisableForeignKeys;
use Illuminate\Database\Seeder;

/**
 * Class UserTableSeeder.
 */
class UserSeeder extends Seeder
{
    use DisableForeignKeys;

    /**
     * Run the database seed.
     */
    public function run()
    {
        $this->disableForeignKeys();

        // Add the master administrator, user id of 1

        User::create([
            'type' => User::TYPE_ADMIN,
            'login' => 'administrator',
            'first_name' => 'Super',
            'last_name' => 'Admin',
            'email' => 'admin@admin.com',
            'password' => bcrypt('secret'),
            'email_verified_at' => now(),
            'status' => User::STATUS_ACTIVE,
            'confirmed' => 1,
        ]);

        User::create([
            'type' => User::TYPE_SUPPORT,
            'login' => 'support',
            'first_name' => 'Jobzz',
            'last_name' => 'Support',
            'email' => 'support@jobzz.ru',
            'password' => bcrypt('secret'),
            'email_verified_at' => now(),
            'status' => User::STATUS_ACTIVE,
            'confirmed' => 1,
        ]);
        
        $this->enableForeignKeys();
    }
}
