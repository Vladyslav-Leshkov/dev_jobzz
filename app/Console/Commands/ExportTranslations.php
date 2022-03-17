<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Content\LanguageLine;

class ExportTranslations extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'translations:export';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

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
        $locales = array_keys(config('site-settings.locale.languages'));

        foreach ($locales as $locale) {
            if (file_exists(resource_path("lang/$locale.json"))) {
                $json = json_decode(file_get_contents(resource_path("lang/$locale.json")), true);
            } else {
                $json = [];
            }

            $translations = LanguageLine::getTranslationsForGroup($locale, '*');
            $json = array_merge($json, $translations);
            file_put_contents(resource_path("lang/$locale.json"), json_encode($json, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE));
        }

        return 0;
    }
}
