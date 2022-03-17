<?php

namespace Database\Seeders;

use App\Models\Job\EnglishLevel;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class EnglishLevelSeeder extends Seeder
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
        $this->truncate('english_levels');

        $items = [
            ['title'=>'Beginner/Elementary (A1)', 'slug'=>'a1',
                'description_ru'=>'Начальные/Базовые знания Английского языка',
                'description_en'=>'Basic knowledge of the English language'],
            ['title'=>'Pre-Intermediate (A2)', 'slug'=>'a2',
                'description_ru'=>'Могу читать техническую документацию и вести переписку на английском языке',
                'description_en'=>'You can read technical documentation and correspond in English'],
            ['title'=>'Intermediate (B1)', 'slug'=>'b1',
                'description_ru'=>'Могу вести диалог на английском языке, но простыми фразами и с ошибками. Могу проходить интервью на английском',
                'description_en'=>'You can conduct a dialogue in English, but with simple phrases and with mistakes. I can be interviewed in English'],
            ['title'=>'Upper-intermediate (B2)', 'slug'=>'b2',
                'description_ru'=>'Могу активно участвовать в митингах, уверенно проходить интервью на английском и поддержать диалог практически на любую тему, но все же допускаю ошибки',
                'description_en'=>'You can actively participate in rallies, confidently pass interviews in English and maintain a dialogue on almost any topic, but I still make mistakes'],
            ['title'=>'Advanced (C1)', 'slug'=>'c1',
                'description_ru'=>'Вы бегло говорите на английском и полностью понимаете речь на слух, для вас не составит труда пройти интервью на английском с носителем и вы легко можете поддержать диалог на любую тему',
                'description_en'=>'You are fluent in English and fully understand the speech by ear, it will not be difficult for you to go through an interview in English with a native speaker and you can easily maintain a dialogue on any topic'],
            ['title'=>'Fluent (C2)', 'slug'=>'c2',
                'description_ru'=>'Вы владеете английским на уровне носителя языка',
                'description_en'=>'You speak English like a native speaker'],
        ];

        foreach ($items as  $item){
            EnglishLevel::create($item);
        }

        $this->enableForeignKeys();
    }
}
