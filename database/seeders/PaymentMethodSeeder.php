<?php

namespace Database\Seeders;

use App\Models\Job\PaymentMethod;
use Database\Seeders\Traits\DisableForeignKeys;
use Database\Seeders\Traits\TruncateTable;
use Illuminate\Database\Seeder;

class PaymentMethodSeeder extends Seeder
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
        $this->truncate('payment_methods');

        $methods = [
            ['title_ru' => 'Visa/MasterCard', 'title_en' => 'Visa/MasterCard', 'slug' => 'card', 'active' => 1],
            ['title_ru' => 'SWIFT', 'title_en' => 'SWIFT', 'slug' => 'swift', 'active' => 1],
            ['title_ru' => 'Счет на оплату (Россия)', 'title_en' => 'Invoice for payment (Russia)', 'slug' => 'invoice', 'active' => 1],
        ];
        foreach ($methods as $method) {
            PaymentMethod::create($method);
        }

        $this->enableForeignKeys();

    }
}
