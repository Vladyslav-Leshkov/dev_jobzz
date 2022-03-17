<?php

namespace Database\Factories\Job;

use App\Models\Job\Partner;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class PartnerFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Partner::class;



    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $title = $this->faker->company;
        $description = $this->faker->text;
        $image_idx = $this->faker->numberBetween(1, 6);
        return [
            //
            'title_ru'=>$title,
            'title_en'=>$title,
            'description_ru'=>$description,
            'description_en'=>$description,
            'slug'=>Str::slug($title),
            'logo'=>"/images/banner-0{$image_idx}.png",
        ];
    }
}
