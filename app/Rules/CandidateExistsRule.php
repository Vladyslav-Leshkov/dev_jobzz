<?php

namespace App\Rules;

use App\Models\Auth\User;
use Illuminate\Contracts\Validation\Rule;

class CandidateExistsRule implements Rule
{
    protected string $email = '';

    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct(string $email)
    {
        //
        $this->email = $email;

    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        //
        return User::query()->where('type', User::TYPE_CANDIDATE)->where('email', $this->email)->count() > 0;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return __('User not found');
    }
}
