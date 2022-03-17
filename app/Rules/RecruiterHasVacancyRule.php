<?php

namespace App\Rules;

use App\Models\Auth\User;
use App\Models\Job\Vacancy;
use Illuminate\Contracts\Validation\Rule;

class RecruiterHasVacancyRule implements Rule
{
    protected User $user;
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct(User $user)
    {
        //
        $this->user = $user;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     *
     * @return bool
     */
    public function passes($attribute, $value)
    {
        //
        $company = $this->user->company;

        return $company !== null && $company->vacancies()->where('id', $value)
                ->whereIn('status', [Vacancy::STATUS_ACTIVE, Vacancy::STATUS_ANONYMOUS])->count() > 0;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'You cannot submit an offer for this vacancy.';
    }
}
