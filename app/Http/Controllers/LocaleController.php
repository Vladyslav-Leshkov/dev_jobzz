<?php

namespace App\Http\Controllers;

class LocaleController extends Controller
{
    //
    public function change(string $locale)
    {
        $locales = array_keys(config('site-settings.locale.languages'));
        if(!in_array($locale, $locales)){
            $locale = 'en';
        }

        app()->setLocale($locale);

        session()->put('locale', $locale);

        return redirect()->back();
    }
}
