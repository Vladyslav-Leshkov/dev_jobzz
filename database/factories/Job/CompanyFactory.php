<?php

namespace Database\Factories\Job;

use App\Models\Job\Company;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class CompanyFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Company::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $title = $this->faker->company;

        return [
            //
            'title' => $title,
            'slug' => Str::slug($title),
            'logo' => '',
            'website' => $this->faker->url,
            'address' => $this->faker->address,
            'description' => $this->faker->realText(1500),
            'status' => Company::STATUS_ACTIVE,
            'ref' => Str::random(8),
            'is_product' => $this->faker->randomElement([0, 1]),
            'moderated' => 1
        ];
    }
}
