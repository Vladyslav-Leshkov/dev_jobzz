<?php

namespace Database\Seeders;

use App\Models\Auth\Role;
use App\Models\Auth\User;
use App\Models\Job\CandidateProfile;
use App\Models\Job\EmploymentType;
use App\Models\Job\Skill;
use App\Models\Job\Specialization;
use App\Models\Location\City;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Faker\Factory as FakerFactory;
use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;

class CandidateSeeder extends Seeder
{
    use DisableForeignKeys, TruncateTable;

    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        //
        $this->disableForeignKeys();
        if (app()->environment() !== 'production') {
            $this->truncateMultiple([
                'candidate_cities',
                'candidate_employment_types',
                'candidate_open_data',
                'candidate_skills',
                'candidate_specializations',
                'candidate_profiles',
            ]);


            User::where('type', User::TYPE_CANDIDATE)->forceDelete();

            $specializations = Specialization::with('skills')->get();
            $employment_types = collect([1, 2, 3, 4, 5]);
            $cities = City::query()->where('used', 1)->get();
            $role = Role::findByType(User::TYPE_CANDIDATE);
            $candidates = User::factory()->count(50)->create([
                'type' => User::TYPE_CANDIDATE,
            ]);

            /**
             * @var User $candidate
             */
            foreach ($candidates as $candidate) {
                $candidate->assignRole($role);

                /**
                 * @var Specialization $specialization
                 */
                $specialization = $specializations->random(1)->first();

                $position = $specialization->title_en . ($specialization->type_id === 1 ? ' Developer' : ' Manager');
                /**
                 * @var CandidateProfile $profile
                 */
                $profile = CandidateProfile::factory()->createOne([
                    'user_id' => $candidate->id,
                    'position' => $position,
                    'slug' => Str::slug($position),
                ]);

                $random_date = Carbon::now()->subDays(rand(0, 10));
                $profile->timestamps = false;
                $profile->created_at = $random_date;
                $profile->updated_at = $random_date;
                $profile->save();

                $profile->specializations()->attach($specialization->id);
                $city_ids = $cities->random(collect([1, 2, 3])->random(1)->first())->pluck('id')->toArray();
                if (count($city_ids) > 0) {
                    $profile->cities()->sync($city_ids);
                }
                $employment_type_ids = $employment_types->random(3)->toArray();
                if (in_array(5, $employment_type_ids)) {
                    $profile->employment_types()->sync([5]);
                } else {
                    $profile->employment_types()->sync($employment_type_ids);
                }
                if ($specialization->skills->count() < 5) {
                    $skill_ids = collect(Skill::take(20)->pluck('id')->toArray());
                } else {
                    $skill_ids = collect($specialization->skills->pluck('id')->toArray());
                }


                $skills = $skill_ids->random(5)->toArray();
                $additional_skills = array_diff($skill_ids->random(count($skill_ids) > 10 ? 10 : count($skill_ids))->toArray(), $skills);

                $profile->skills()->attach($skills, ['main' => 1]);
                $profile->skills()->attach($additional_skills, ['main' => 0]);


                $candidate->timestamps = false;
                $candidate->position = $position;
                $candidate->created_at = $random_date;
                $candidate->updated_at = $random_date;
                $candidate->save();
            }
        }


        $this->enableForeignKeys();
    }
}
