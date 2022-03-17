<?php

namespace App\Exceptions\Content;

use Exception;
use Illuminate\Support\Facades\Lang;

class AttributeIsNotTranslatable extends Exception
{
    public static function make(string $key, $model)
    {
        $translatableAttributes = implode(', ', $model->getTranslatableAttributes());

        return new static(Lang::get("Cannot translate attribute `:key` as it's not one of the translatable attributes: ", ['key'=>$key])."`$translatableAttributes`");
    }
}
