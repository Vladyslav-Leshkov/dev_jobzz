<?php

namespace Database\Seeders;

use App\Models\Job\EmploymentType;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class EmploymentTypeSeeder extends Seeder
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
        $this->truncate('employment_types');

        $items = [
            [
                'slug'=>'office-full-time',
                'title_ru'=>'В офисе',
                'title_en'=>'In the office',
                'description_ru'=>'полный рабочий день',
                'description_en'=>'full time',
                'freelance'=>0,
                'remotely'=>0,
            ],
            [
                'slug'=>'remotely-full-time',
                'title_ru'=>'Удаленно',
                'title_en'=>'Remotely',
                'description_ru'=>'полный рабочий день',
                'description_en'=>'full time',
                'freelance'=>0,
                'remotely'=>1,
            ],
            [
                'slug'=>'move-to-city',
                'title_ru'=>'Готов к переезду в другой город',
                'title_en'=>'Ready to move to another city',
                'description_ru'=>'',
                'description_en'=>'',
                'freelance'=>0,
                'remotely'=>0,
            ],
            [
                'slug'=>'move-to-country',
                'title_ru'=>'Готов к переезду в другую страну',
                'title_en'=>'Ready to move to another country',
                'description_ru'=>'',
                'description_en'=>'',
                'freelance'=>0,
                'remotely'=>0,
            ],
            [
                'slug'=>'freelance',
                'title_ru'=>'Фриланс',
                'title_en'=>'Freelance',
                'description_ru'=>'занятость на половину дня или менее, разовые короткие проекты или консультации',
                'description_en'=>'half-day employment or less, one-off short projects or consultations',
                'freelance'=>1,
                'remotely'=>0,
            ],
        ];

        foreach ($items as  $item){
            EmploymentType::create($item);
        }

        $this->enableForeignKeys();
    }
}
