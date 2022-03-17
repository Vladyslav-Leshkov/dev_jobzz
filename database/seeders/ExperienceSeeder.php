<?php

namespace Database\Seeders;

use App\Models\Job\Experience;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class ExperienceSeeder extends Seeder
{
    use TruncateTable, DisableForeignKeys;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->disableForeignKeys();
        $this->truncate('experiences');
        //
        $experiences = [
            ['title_ru'=>'Без опыта', 'title_en'=>'Without experience'],
            ['title_ru'=>'от 1 года', 'title_en'=>'from 1 year'],
            ['title_ru'=>'от 2 лет', 'title_en'=>'from 2 years'],
            ['title_ru'=>'от 3 лет', 'title_en'=>'from 3 years'],
            ['title_ru'=>'от 4 лет', 'title_en'=>'from 4 years'],
            ['title_ru'=>'5 лет и более', 'title_en'=>'5 years or more'],
        ];

        foreach ($experiences as $experience){
            Experience::create($experience);
        }

        $this->enableForeignKeys();
    }
}
