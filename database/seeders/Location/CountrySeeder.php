<?php

namespace Database\Seeders\Location;

use App\Models\Location\Country;
use Illuminate\Database\Seeder;

class CountrySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $countries_ru = require __DIR__.'/../Data/countries_ru.php';
        $countries_en = require __DIR__.'/../Data/countries_en.php';

        foreach ($countries_ru as $code=>$title_ru){
            $title_en = $countries_en[$code];
            Country::query()->updateOrCreate(['code'=>$code], [
                'code'=>$code,
                'title_ru'=>$title_ru,
                'title_en'=>$title_en,
            ]);
        }
    }
}
