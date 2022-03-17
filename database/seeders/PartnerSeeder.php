<?php

namespace Database\Seeders;

use App\Models\Job\Partner;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class PartnerSeeder extends Seeder
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

        $this->truncate('partners');

        //
        Partner::factory()->count(36)->create();

        $this->enableForeignKeys();
    }
}
