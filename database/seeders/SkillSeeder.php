<?php

namespace Database\Seeders;

use App\Models\Job\Skill;
use App\Models\Job\Specialization;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;
use Illuminate\Support\Str;

class SkillSeeder extends Seeder
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
        $this->truncateMultiple(['specializations_skills', 'skills']);

        $items = include __DIR__.'/Data/skills.php';
        $recommendations = include __DIR__.'/Data/skills-recom.php';


        foreach ($items as  $item) {
            $item = trim($item);
            $data = ['title_ru' => $item, 'title_en' => $item, 'slug' => Str::slug($item), 'popular' => 0];
            Skill::create($data);
        }

        foreach ($recommendations as $spec => $skills) {
            $spec = trim($spec);
            $spec_item = Specialization::where('title_ru', $spec)->first();
            if ($spec_item === null) {
                throw new \Exception('Spec not found: '.$spec);
            }

            $skill_ids = [];
            foreach ($skills as $skill) {
                $skill = trim($skill);
                $skill_item = Skill::where('slug', Str::slug($skill))->first();

                if ($skill_item === null) {
                    throw new \Exception('Skill not found: '.$skill);
                }
                $skill_ids[] = $skill_item->id;
            }

            $spec_item->skills()->sync(array_unique($skill_ids));
        }

        $this->enableForeignKeys();
    }
}
