<?php

namespace Database\Seeders\Location;

use App\Models\Location\City;
use App\Models\Location\Country;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class CitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $used_cities = [
            'Москва',
            'Санкт-Петербург',
            'Белгород',
            'Волгоград',
            'Воронеж',
            'Екатеринбург',
            'Иркутск',
            'Казань',
            'Калининград',
            'Калуга ',
            'Краснодар',
            'Курск',
            'Липецк',
            'Нижний Новгород',
            'Новокузнецк',
            'Новосибирск',
            'Омск',
            'Орел',
            'Оренбург',
            'Псков',
            'Ростов-на-Дону',
            'Севастополь',
            'Тверь',
            'Томск',
            'Тула',
            'Уфа',
            'Хабаровск',
            'Чебоксары',
            'Челябинск',
            'Якутск',
            'Ялта',
        ];

        $popular_cities = [
            'Москва',
            'Санкт-Петербург',
        ];

        //
        $data = collect(json_decode(file_get_contents(__DIR__.'/../Data/russian-cities.json')));
        $russia = Country::whereCode('RU')->first();
        $regions = $russia->regions()->get();

        foreach ($data as $city){
            $region = $regions->where('slug', '=', Str::slug($city->subject))->first();
            if($region){
                City::create([
                    'country_id' => $russia->id,
                    'region_id' => $region->id,
                    'title_ru' => $city->name,
                    'title_en' => Str::ascii($city->name),
                    'used'=>in_array($city->name, $used_cities),
                    'popular'=>in_array($city->name, $popular_cities),
                ]);
            }

        }

    }
}
