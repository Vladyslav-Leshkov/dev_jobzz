<?php

namespace Database\Factories\Auth;

use App\Models\Auth\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class UserFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = User::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $gender = $this->faker->randomElement([User::GENDER_MALE, User::GENDER_FEMALE]);
        $type = $this->faker->randomElement([User::TYPE_ADMIN, User::TYPE_CANDIDATE, User::TYPE_RECRUITER]);

        return [
            'type' => $type,
            'login' => null,
            'first_name' => $this->faker->firstName($gender),
            'last_name' => $this->faker->lastName($gender),
            'email' => $this->faker->unique()->safeEmail,
            'phone' => $this->faker->unique()->phoneNumber,
            'position' => $this->faker->randomElement(['Director', 'Manager', 'HR Manager']),
            'gender' => $gender,
            'email_verified_at' => now(),
            'password' => bcrypt('secret12345'),
            'password_changed_at' => null,
            'remember_token' => Str::random(10),
            'status' => User::STATUS_ACTIVE,
        ];
    }

    /**
     * @return UserFactory
     */
    public function admin()
    {
        return $this->state(function (array $attributes) {
            return [
                'type' => User::TYPE_ADMIN,
            ];
        });
    }

    /**
     * @return UserFactory
     */
    public function candidate()
    {
        return $this->state(function (array $attributes) {
            return [
                'type' => User::TYPE_CANDIDATE,
            ];
        });
    }

    /**
     * @return UserFactory
     */
    public function recruiter()
    {
        return $this->state(function (array $attributes) {
            return [
                'type' => User::TYPE_RECRUITER,
            ];
        });
    }


    /**
     * @return UserFactory
     */
    public function active()
    {
        return $this->state(function (array $attributes) {
            return [
                'status' => User::STATUS_ACTIVE,
            ];
        });
    }

    /**
     * @return UserFactory
     */
    public function inactive()
    {
        return $this->state(function (array $attributes) {
            return [
                'status' => User::STATUS_INACTIVE,
            ];
        });
    }

    /**
     * @return UserFactory
     */
    public function confirmed()
    {
        return $this->state(function (array $attributes) {
            return [
                'email_verified_at' => now(),
            ];
        });
    }

    /**
     * @return UserFactory
     */
    public function unconfirmed()
    {
        return $this->state(function (array $attributes) {
            return [
                'email_verified_at' => null,
            ];
        });
    }

    /**
     * @return UserFactory
     */
    public function passwordExpired()
    {
        return $this->state(function (array $attributes) {
            return [
                'password_changed_at' => now()->subYears(5),
            ];
        });
    }

    /**
     * @return UserFactory
     */
    public function deleted()
    {
        return $this->state(function (array $attributes) {
            return [
                'deleted_at' => now(),
            ];
        });
    }
}
