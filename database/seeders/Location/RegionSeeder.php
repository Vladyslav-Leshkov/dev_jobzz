<?php

namespace Database\Seeders\Location;

use App\Models\Location\Country;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class RegionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $data = collect(json_decode(file_get_contents(__DIR__.'/../Data/russian-cities.json'), true));
        $region_ru_names = $data->pluck('subject')->unique()->sort();

        $russia = Country::whereCode('RU')->first();

        if($russia !== null){
            foreach ($region_ru_names as $title_ru){
                $russia->regions()->create([
                    'title_ru' => $title_ru,
                    'title_en' => Str::ascii($title_ru),
                    'slug' => Str::slug($title_ru),
                ]);
            }
        }
    }
}
