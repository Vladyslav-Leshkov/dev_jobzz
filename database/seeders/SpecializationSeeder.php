<?php

namespace Database\Seeders;

use App\Models\Job\SpecializationType;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class SpecializationSeeder extends Seeder
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
            'specialization_types',
            'specializations',
        ]);
        //
        $types = [
            [
                'id' => 1,
                'title_ru' => 'Разработка',
                'title_en' => 'Development',
                'popular' => 1,
                'items' => [
                    ['title_ru' => 'Android', 'title_en' => 'Android', 'popular' => 1],
                    ['title_ru' => 'C/C++/Embedded', 'title_en' => 'C/C++/Embedded', 'popular' => 1],
                    ['title_ru' => 'C#/.Net', 'title_en' => 'C#/.Net', 'popular' => 1],
                    ['title_ru' => 'Front End', 'title_en' => 'Front End'],
                    ['title_ru' => 'Full Stack', 'title_en' => 'Full Stack', 'popular' => 1],
                    ['title_ru' => 'Golang', 'title_en' => 'Golang'],
                    ['title_ru' => 'iOS/macOS', 'title_en' => 'iOS/macOS'],
                    ['title_ru' => 'Java', 'title_en' => 'Java'],
                    ['title_ru' => 'Node.js', 'title_en' => 'Node.js'],
                    ['title_ru' => 'PHP', 'title_en' => 'PHP', 'popular' => 1],
                    ['title_ru' => 'Python', 'title_en' => 'Python', 'popular' => 1],
                    ['title_ru' => 'React Native', 'title_en' => 'React Native'],
                    ['title_ru' => 'Ruby/RoR', 'title_en' => 'Ruby/RoR'],
                    ['title_ru' => 'Scala', 'title_en' => 'Scala'],
                    ['title_ru' => 'Other', 'title_en' => 'Other', 'slug' => 'development-other'],
                ],
            ],
            [
                'id' => 2,
                'title_ru' => 'Другие технические',
                'title_en' => 'Other technical',
                'popular' => 1,
                'items' => [
                    ['title_ru' => 'Business Analyst ', 'title_en' => 'Business Analyst', 'popular' => 1],
                    ['title_ru' => 'Data Science', 'title_en' => 'Data Science'],
                    ['title_ru' => 'DBA/SQL/PL/SQL', 'title_en' => 'DBA/SQL/PL/SQL', 'popular' => 1],
                    ['title_ru' => 'DevOps/Sysadmin', 'title_en' => 'DevOps/Sysadmin'],
                    ['title_ru' => 'Product Manager', 'title_en' => 'Product Manager', 'popular' => 1],
                    ['title_ru' => 'Project Manager ', 'title_en' => 'Project Manager', 'popular' => 1],
                    ['title_ru' => 'QA', 'title_en' => 'QA'],
                    ['title_ru' => 'SEO', 'title_en' => 'SEO', 'popular' => 1],
                    ['title_ru' => 'UE/Unity/etc', 'title_en' => 'UE/Unity/etc'],
                    ['title_ru' => 'UI/UX/Design', 'title_en' => 'UI/UX/Design', 'popular' => 1],
                    ['title_ru' => 'Other', 'title_en' => 'Other', 'slug' => 'technical-other'],
                ],
            ],
            [
                'id' => 3,
                'title_ru' => 'Нетехнические',
                'title_en' => 'Non-technical',
                'popular' => 0,
                'items' => [
                    ['title_ru' => 'HR/Recruiter', 'title_en' => 'HR/Recruiter'],
                    ['title_ru' => 'Marketing', 'title_en' => 'Marketing'],
                    ['title_ru' => 'Sales', 'title_en' => 'Sales'],
                    ['title_ru' => 'Support', 'title_en' => 'Support'],
                    ['title_ru' => 'Other', 'title_en' => 'Other'],
                ],
            ],
        ];

        foreach ($types as $type) {
            $items = $type['items'];
            unset($type['items']);
            $spec_type = SpecializationType::create($type);
            foreach ($items as $item) {
                $spec_type->items()->create($item);
            }
        }

        $this->enableForeignKeys();
    }
}
