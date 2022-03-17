<?php

namespace Database\Factories\Job;

use App\Models\Job\CandidateProfile;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class CandidateProfileFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = CandidateProfile::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $position = $this->faker->text(30) . ' ' . $this->faker->randomElement([' Developer', ' Manager']);
        
        return [
            //
            'position' => $position,
            'slug' => Str::slug($position),
            'description' => $this->faker->realText(1000),
            'experience' => $this->faker->numberBetween(0, 8),
            'price_full_time' => $this->faker->numberBetween(1, 8) * 100000,
            'price_freelance' => $this->faker->numberBetween(4, 15) * 100,
            'english_level' => $this->faker->numberBetween(1, 6),
            'moderated' => 1,
        ];
    }
}
