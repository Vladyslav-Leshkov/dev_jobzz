<?php

namespace Database\Seeders;

use App\Models\Auth\Role;
use App\Models\Auth\User;
use App\Models\Job\Company;
use App\Models\Job\EmploymentType;
use App\Models\Job\Specialization;
use App\Models\Job\Vacancy;
use App\Models\Location\City;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Str;

class RecruiterSeeder extends Seeder
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
        $this->disableForeignKeys();
        if (app()->environment() !== 'production') {
            $this->truncateMultiple([
                'vacancy_cities',
                'vacancy_employment_types',
                'vacancy_specializations',
                'vacancy_skills',
                'vacancies',
                'company_users',
                'companies',
            ]);

            User::where('type', User::TYPE_RECRUITER)->forceDelete();

            $specializations = Specialization::with('skills')->get();
            $employment_types = EmploymentType::query()->get();
            $cities = City::query()->where('used', 1)->get();
            $role = Role::findByType(User::TYPE_RECRUITER);
            $recruiters = User::factory()->count(10)->create([
                'type' => User::TYPE_RECRUITER,
            ]);

            /**
             * @var User $recruiter
             */
            foreach ($recruiters as $recruiter) {
                $recruiter->assignRole($role);
                /**
                 * @var Company $company
                 */
                $company = Company::factory()->createOne();
                $company->users()->attach($recruiter->id, ['is_admin' => 1, 'status' => 1]);

                $vacancies = Vacancy::factory()->count(5)->create([
                    'user_id' => $recruiter->id,
                    'company_id' => $company->id,
                    'is_product' => $company->is_product
                ]);

                /**
                 * @var Vacancy $vacancy
                 */
                foreach ($vacancies as $vacancy) {
                    /**
                     * @var Specialization $specialization
                     */
                    $specialization = $specializations->random(1)->first();
                    $vacancy->specializations()->attach($specialization->id);
                    $is_remotely = collect([0, 2])->random(1)->first();
                    if ($is_remotely !== 0) {
                        $vacancy->employment_types()->attach(2);
                    }
                    $city_ids = $cities->random(collect([1, 2, 3])->random(1)->first())->pluck('id')->toArray();
                    if (count($city_ids) > 0) {
                        $vacancy->cities()->sync($city_ids);
                    }
                    $vacancy_title = $specialization->title_en . ($specialization->type_id === 1 ? ' Developer' : ' Manager');
                    $vacancy->title = $vacancy_title;
                    $vacancy->slug = $vacancy->id . '-' . Str::slug($vacancy_title);
                    $random_date = Carbon::now()->subDays(rand(0, 10));
                    $vacancy->created_at = $random_date;
                    $vacancy->updated_at = $random_date;
                    $vacancy->save();
                }

                $recruiter->vacancies()->saveMany($vacancies);
            }
        }


        $this->enableForeignKeys();
    }
}
