<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class Url implements Rule
{
    public function passes($attribute, $value)
    {
        if (empty($value)) {
            return true;
        }

        $regex = '/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/';

        return preg_match($regex, $value) !== false;
    }

    public function message()
    {
        // TODO: Implement message() method.
        return __('Invalid Url');
    }
}
