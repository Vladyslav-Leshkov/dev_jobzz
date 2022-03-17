<?php

namespace App\Models\Job\Traits;

trait HasLocationTitle
{
    public function getLocationTitleAttribute()
    {
        $title = $this->cities->map->title()->implode(', ');

        if ($this->is_remotely) {
            if (strlen($title) > 0) {
                $title .= ' <span class="alt">'.__('or').'</span> ';
            }
            $freelance = $this->relationLoaded('employment_types')
                ? $this->employment_types->where('remotely', 1)->first()
                : $this->employment_types()->where('remotely', 1)->first();
            $title .= $freelance->title;
        }

        return  $title;
    }
}
