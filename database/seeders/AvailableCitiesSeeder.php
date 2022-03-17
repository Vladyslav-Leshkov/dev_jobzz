<?php

namespace Database\Seeders;

use App\Models\Location\City;
use Illuminate\Database\Seeder;

class AvailableCitiesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $cities = include __DIR__.'/Data/available_cities.php';

        foreach ($cities as $city) {
            $city_parts = explode('(', $city);
            $city = trim($city_parts[0]);

            if(City::where('title_ru', $city)->count() > 0){
                City::where('title_ru', $city)->update(['used' => 1]);
            }else{
                echo "$city\n";
            }


        }
    }
}
