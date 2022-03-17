<?php
/*
 * Технические настройки сайта
 */
return [
    'user'=>[
        /*
        * Whether or not a user can change their email address after
        * their account has already been created
        */
        'change_email' => env('CHANGE_EMAIL', true),

        /*
         * When creating users from the backend, only allow the assigning of roles and not individual permissions
         */
        'only_roles' => false,

        'permanently_delete'=>true,

        'password_history'=>env('PASSWORD_HISTORY', 3),
    ],
    'access'=>[
        'captcha'=>[
            'configs' => [
                'site_key'   => env('INVISIBLE_RECAPTCHA_SITEKEY'),
                'secret_key' => env('INVISIBLE_RECAPTCHA_SECRETKEY'),
                'options'   => [
                    'hidden' => false,
                    'location' => 'bottomright',
                    'timeout' => 5,
                ],
            ],
            /*
             *
             */
            'registration'=>env('CAPTCHA_REGISTRATION_ENABLED', false),
            /*
             *
             */
            'login'=>env('CAPTCHA_LOGIN_ENABLED', false),
        ],
    ],
    'locale'=>[
        'status'=>true,
        'multi'=>true,
        'languages'=>[
            'ru' => ['name' => 'Русский', 'short_name' => 'Рус', 'rtl' => false],
            'en' => ['name' => 'English', 'short_name' => 'Eng', 'rtl' => false],
        ],
    ],
];
