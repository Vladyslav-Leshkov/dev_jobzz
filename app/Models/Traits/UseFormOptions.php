<?php

namespace App\Models\Traits;

use Illuminate\Support\Facades\App;

trait UseFormOptions
{
    public static function toSelectBox($localized = false, $text_field = 'title', $value_field = 'id') : array
    {
        if ($localized) {
            $locale = App::getLocale();
            $text_field = $text_field.'_'.$locale;
        }

        return self::query()->select(["$text_field as text", "$value_field as value"])->get()->toArray();
    }
}
