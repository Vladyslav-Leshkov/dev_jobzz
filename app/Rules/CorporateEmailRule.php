<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class CorporateEmailRule implements Rule
{
    protected $email;

    protected $role = 'candidate';

    protected $domains = [
        'yahoo.com',
        'hotmail.com',
        'gmail.com',
        'live.com',
        'mail.ru',
        'internet.ru',
        'bk.ru',
        'list.ru',
        'inbox.ru',
        'mail.ua',
        'meta.ua',
        'ukr.net',
        'i.ua',
        'yandex.ru',
        'yandex.ua',
        'ya.ru',
        'rambler.ru',
        'lenta.ru',
        'autorambler.ru',
        'myrambler.ru',
        'ro.ua',
    ];

    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct($email, $role)
    {
        //
        $this->email = $email;
        $this->role = $role;
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
        $domain = substr($this->email, strpos($this->email, '@'));
        return $this->role !== 'recruiter' || !in_array($domain, $this->domains);
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return __('Corporate mail only');
    }
}
