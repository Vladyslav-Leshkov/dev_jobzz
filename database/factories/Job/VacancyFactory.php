<?php

namespace Database\Factories\Job;

use App\Models\Job\Vacancy;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class VacancyFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Vacancy::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $title = $this->faker->text(100);
        $price_from = $this->faker->randomElement([0, 100000, 200000, 500000]);
        $relocate = $this->faker->randomElement([0, 1]);
        return [
            //
            'title' => $this->faker->realText(50),
            'slug' => Str::slug($title),
            'status' => Vacancy::STATUS_ACTIVE,
            'short_description' => $this->faker->realText(500),
            'description' => $this->faker->realText(2500),
            'experience' => $this->faker->numberBetween(0, 6),
            'english_level' => $this->faker->numberBetween(1, 6),
            'price_from' => $price_from,
            'price_to' => $price_from + $this->faker->randomElement([100000, 200000, 300000]),
            'is_product' => $this->faker->randomElement([0, 1]),
            'relocate' => $relocate,
            'help_relocate' => $relocate === 1 ? $this->faker->randomElement([0, 1]) : 0,
        ];
    }
}
