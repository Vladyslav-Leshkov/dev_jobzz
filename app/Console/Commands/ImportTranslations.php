<?php

namespace App\Console\Commands;

use App\Models\Content\LanguageLine;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\File;

class ImportTranslations extends Command
{
    protected $skipExists = false;

    protected $allLines;

    protected $locales = [];

    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'translations:import {--T|truncate} {--S|skip-exists}';

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
        if ($this->option('skip-exists') ?? false) {
            $this->skipExists = true;
        }

        if ($this->option('truncate') ?? false) {
            LanguageLine::truncate();
        }

        $this->locales = array_keys(config('site-settings.locale.languages'));
        $languagePath = resource_path("lang");


        $this->allLines = LanguageLine::orderBy('group')->get();

        $files = File::files($languagePath);
        foreach ($files as $file) {
            if ($file->getExtension() === 'json') {
                $this->importJsonFile($file);
            }
        }

        $directories = File::directories($languagePath);
        foreach ($directories as $directory) {
            $this->importDirectory($directory);
        }

        $this->info('Translations imported!');

        return 0;
    }

    private function importJsonFile($file)
    {
        $fileLocale = $file->getFilenameWithoutExtension();
        if (in_array($fileLocale, $this->locales)) {
            $json = json_decode(file_get_contents($file->getRealPath()), true);
            foreach ($json as $key => $value) {
                $this->createOrUpdate('*', $key, $fileLocale, $value);
            }
        }
    }


    public function importDirectory($path)
    {
        $locale = basename($path);
        if (in_array($locale, $this->locales)) {
            $files = File::files($path);
            foreach ($files as $file) {
                $group = $file->getFilenameWithoutExtension();
                $data = include $file->getRealPath();
                foreach ($data as $key => $value) {
                    if (is_array($value)) {
                        $this->importArray($group, $key, $locale, $value);
                    } else {
                        $this->createOrUpdate($group, $key, $locale, $value);
                    }
                }
            }
        }
    }

    public function importArray($group, $parentKey, $locale, $array)
    {
        foreach ($array as $key => $value) {
            $subKey = $parentKey . '.' . $key;
            if (is_array($value)) {
                $this->importArray($group, $subKey, $locale, $value);
            } else {
                $this->createOrUpdate($group, $subKey, $locale, $value);
            }
        }
    }

    public function createOrUpdate($group, $key, $locale, $value)
    {
        $languageLine = $this->allLines->where('group', $group)->where('key', $key)->first();
        if (empty($languageLine)) {
            $languageLine = new LanguageLine();
            $languageLine->group = $group;
            $languageLine->key = $key;
            $languageLine->text = [$locale => $value];
            $languageLine->save();
            $this->allLines->push($languageLine);
        } elseif ($this->skipExists) {
            $text = $languageLine->text ?? [];
            $text[$locale] = $value;
            $languageLine->text = $text;
            $languageLine->save();
        }
    }
}
