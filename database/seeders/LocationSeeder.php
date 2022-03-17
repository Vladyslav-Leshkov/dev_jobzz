<?php

namespace Database\Seeders;

use Database\Seeders\Location\CitySeeder;
use Database\Seeders\Location\CountrySeeder;
use Database\Seeders\Location\RegionSeeder;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class LocationSeeder extends Seeder
{
    use TruncateTable, DisableForeignKeys;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $this->disableForeignKeys();

        $this->truncateMultiple([
            'cities',
            'regions',
            'countries',
        ]);

        $this->call(CountrySeeder::class);

        $this->call(RegionSeeder::class);

        $this->call(CitySeeder::class);

        $this->enableForeignKeys();
    }
}
