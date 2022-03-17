<?php

namespace Database\Factories\Content;

use App\Models\Content\Page;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class PageFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Page::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $title = $this->faker->jobTitle;

        return [
            'title' => $title,
            'text'=>$this->faker->realText(1500),
            'slug'=>Str::slug($title),
            'published'=>1,
        ];
    }
}
