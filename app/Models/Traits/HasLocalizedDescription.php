<?php

namespace App\Models\Traits;

use Illuminate\Support\Facades\App;

trait HasLocalizedDescription
{
    public function getDescriptionAttribute()
    {
        $locale = App::getLocale();

        return $this->{'description_'.$locale};
    }
}
