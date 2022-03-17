<?php

namespace Database\Factories\Auth;

use App\Models\Auth\Role;
use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * Class RoleFactory.
 */
class RoleFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Role::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'type' => $this->faker->randomElement([User::TYPE_ADMIN, User::TYPE_CANDIDATE, User::TYPE_RECRUITER]),
            'name' => $this->faker->word,
        ];
    }
}
