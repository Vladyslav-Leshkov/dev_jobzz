<?php

namespace App\Console\Commands;


use App\Models\Content\LanguageLine;
use Artisan;
use Illuminate\Console\Command;
use Illuminate\Support\Arr;
use Storage;

class TranslationPublish extends Command
{
    protected $locales = [];

    protected $groups = [];

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'translations:publish {--S|skip-import}';

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
        if (!$this->option('skip-import')) {
            if (LanguageLine::query()->count() === 0) {
                Artisan::call('translations:import');
            } else {
                Artisan::call('translations:import --skip-exists');
            }
        }


        $this->locales = array_keys(config('site-settings.locale.languages'));
        $this->groups = LanguageLine::select('group')->distinct()->pluck('group')->toArray();
        Storage::makeDirectory('public/lang');
        foreach ($this->groups as $group) {
            $this->processGroup($group);
        }

        $this->info('Translations published!');
        return Command::SUCCESS;
    }


    public function processGroup($group)
    {
        $lines = LanguageLine::where('group', $group)->orderBy('key')->get();
        foreach ($this->locales as $locale) {
            $array = [];
            foreach ($lines as $line) {
                if ($line->hasTranslation($locale)) {
                    if ($group !== '*') {
                        Arr::set($array, $line->key, $line->getTranslation($locale));
                    } else {
                        $array[$line->key] = $line->getTranslation($locale);
                    }
                } elseif ($group === '*') {
                    $array[$line->key] = $line->key;
                }
            }
            $file_name = $group === '*' ? $locale . '.json' : $locale . '/' . $group . '.json';

            Storage::put('public/lang/' . $file_name, json_encode($array, JSON_PRETTY_PRINT));

        }


    }
}
