<?php

namespace Database\Seeders;

use App\Models\Job\Currency;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class CurrencySeeder extends Seeder
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
        $this->truncate('currencies');

        $items = [
            [
                'title_ru' => 'руб.',
                'title_en' => 'rub.',
                'description_ru' => 'Российский рубль',
                'description_en' => 'Russian ruble',
                'symbol' => '₽',
                'iso' => 'RUB',
                'course' => 1,

            ],
            [
                'title_ru' => 'дол.',
                'title_en' => 'dollars',
                'description_ru' => 'Доллар США',
                'description_en' => 'U.S. dollar',
                'symbol' => '$',
                'iso' => 'USD',
                'course' => 0.013726,
            ],
            [
                'title_ru' => 'евро',
                'title_en' => 'euro',
                'description_ru' => 'Евро',
                'description_en' => 'Euro',
                'symbol' => '€',
                'iso' => 'EUR',
                'course' => 0.011619,
            ],
        ];

        foreach ($items as $item) {
            Currency::create($item);
        }

        $this->enableForeignKeys();
    }
}
