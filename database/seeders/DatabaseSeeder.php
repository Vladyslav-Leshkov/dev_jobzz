<?php

namespace Database\Seeders;

use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Seeder;

/**
 * Class DatabaseSeeder.
 */
class DatabaseSeeder extends Seeder
{
    use TruncateTable, DisableForeignKeys;

    /**
     * Seed the application's database.
     */
    public function run()
    {


        Model::unguard();

        $this->truncateMultiple([
            //'activity_log',
            'failed_jobs',
        ]);
        $this->call(SiteOptionSeeder::class);
        $this->call(AuthSeeder::class);
        $this->call(PagesSeeder::class);
        $this->call(MenuSeeder::class);
        $this->call(LocationSeeder::class);
        $this->call(AvailableCitiesSeeder::class);
        $this->call(SpecializationSeeder::class);
        $this->call(ExperienceSeeder::class);
        $this->call(SalarySeeder::class);
        $this->call(EnglishLevelSeeder::class);
        $this->call(CurrencySeeder::class);
        $this->call(EmploymentTypeSeeder::class);
        $this->call(SkillSeeder::class);
        $this->call(PaymentMethodSeeder::class);
        $this->call(PartnerSeeder::class);
        $this->call(HtmlBlockSeeder::class);
        $this->call(CandidateSeeder::class);
        $this->call(RecruiterSeeder::class);
        
        Model::reguard();


    }
}
