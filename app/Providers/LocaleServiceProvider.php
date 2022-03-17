<?php

namespace App\Providers;

use Carbon\Carbon;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;

/**
 * Class LocaleServiceProvider.
 */
class LocaleServiceProvider extends ServiceProvider
{
    /**
     * Register bindings in the container.
     */
    public function boot()
    {
        app()->setLocale(config('app.locale'));
        setlocale(LC_TIME, config('app.locale'));
        Carbon::setLocale(config('app.locale'));
        $this->registerBladeExtensions();
    }

    /**
     * Register the locale blade extensions.
     */
    protected function registerBladeExtensions(): void
    {
        /*
         * The block of code inside this directive indicates
         * the chosen language requests RTL support.
         */
        Blade::if('langrtl', function () {
            return session()->has('lang-rtl');
        });
    }
}
