<?php

namespace Database\Seeders;

use App\Models\Job\Salary;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class SalarySeeder extends Seeder
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
        $this->truncate('salaries');
        //
        $salaries = [
            ['sum_rub'=>100000, 'sum_usd'=> 1000, 'sum_eur'=>1000],
            ['sum_rub'=>200000, 'sum_usd'=> 2000, 'sum_eur'=>2000],
            ['sum_rub'=>300000, 'sum_usd'=> 3000, 'sum_eur'=>3000],
            ['sum_rub'=>400000, 'sum_usd'=> 4000, 'sum_eur'=>4000],
            ['sum_rub'=>500000, 'sum_usd'=> 5000, 'sum_eur'=>5000],
        ];

        foreach ($salaries as $salary){
            Salary::create($salary);
        }

        $this->enableForeignKeys();
    }
}
