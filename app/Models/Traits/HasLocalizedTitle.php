<?php

namespace App\Models\Traits;

use Illuminate\Support\Facades\App;

trait HasLocalizedTitle
{
    public static function hasLocalizedTitle(): bool
    {
        return true;
    }

    public function getTitleAttribute()
    {
        $locale = App::getLocale();

        return $this->{'title_'.$locale};
    }
}
