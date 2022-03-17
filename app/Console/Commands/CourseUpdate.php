<?php

namespace App\Console\Commands;

use App\Models\Job\Currency;
use GuzzleHttp\Client;
use Illuminate\Console\Command;

class CourseUpdate extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'course:update';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Обновление курсов валют';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $client = new Client([
            'base_uri' => 'https://www.cbr-xml-daily.ru',
        ]);
        $response = $client->request('GET', '/latest.js');
        if($response->getStatusCode() === 200){
            $data = json_decode($response->getBody(), true);
            $rates = $data['rates'];
            $currencies = Currency::all();
            foreach ($currencies as $currency){
                if(array_key_exists($currency->iso, $rates)){
                    $currency->course = (float)$rates[$currency->iso];
                    $currency->save();
                }
            }
        }

        return 0;
    }
}
