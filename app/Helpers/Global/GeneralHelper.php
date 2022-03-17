<?php

use App\Models\Common\SiteOption;
use Carbon\Carbon;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\ViewErrorBag;

if (!function_exists('appName')) {
    /**
     * Helper to grab the application name.
     *
     * @return mixed
     */
    function appName()
    {
        return config('app.name', 'Laravel Boilerplate');
    }
}

if (!function_exists('carbon')) {
    /**
     * Create a new Carbon instance from a time.
     *
     * @param $time
     *
     * @return Carbon
     * @throws Exception
     *
     */
    function carbon($time)
    {
        return new Carbon($time);
    }
}

if (!function_exists('homeRoute')) {
    /**
     * Return the route to the "home" page depending on authentication/authorization status.
     *
     * @return string
     */
    function homeRoute()
    {
        if (auth()->check()) {
            if (current_user()->isAdmin()) {
                return 'admin.dashboard';
            }

            if (current_user()->isRecruiter()) {
                return 'frontend.candidate.index';
            }

            if (current_user()->isCandidate()) {
                return 'frontend.vacancy.index';
            }
        }

        return 'frontend.home.index';
    }
}

if (!function_exists('storage_url')) {
    function storage_url($path)
    {
        return \Illuminate\Support\Facades\Storage::url($path);
    }
}

if (!function_exists('current_user_id')) {
    function current_user_id()
    {
        if (auth()->check()) {
            return auth()->id();
        }
        return null;
    }
}

if (!function_exists('current_user')) {
    /**
     * Текущий авторизованный пользователь
     *
     * @return \App\Models\Auth\User|Authenticatable|null
     */
    function current_user()
    {
        if (auth()->check()) {
            return auth()->user();
        }

        return null;
    }
}

if (!function_exists('support_user')) {
    /**
     * Текущий авторизованный пользователь
     *
     * @return \App\Models\Auth\User|Authenticatable|null
     */
    function support_user()
    {
        return \App\Models\Auth\User::supportUser();
    }
}

if (!function_exists('is_admin')) {
    /**
     * Является текущий авторизованный пользователь админом
     *
     * @return boolean
     */
    function is_admin()
    {
        if (current_user() !== null) {
            return current_user()->isAdmin();
        }

        return false;
    }
}

if (!function_exists('is_candidate')) {
    /**
     * Является текущий авторизованный пользователь кандидатом
     *
     * @return boolean
     */
    function is_candidate()
    {
        if (current_user() !== null) {
            return current_user()->isCandidate();
        }

        return false;
    }
}

if (!function_exists('is_recruiter')) {
    /**
     * Является текущий авторизованный пользователь рекрутером
     *
     * @return boolean
     */
    function is_recruiter()
    {
        if (current_user() !== null) {
            return current_user()->isRecruiter();
        }

        return false;
    }
}

if (!function_exists('is_blocked')) {
    /**
     * Является текущий авторизованный пользователь заблокированным
     *
     * @return boolean
     */
    function is_blocked()
    {
        return current_user() !== null && current_user()->isBlocked();
    }
}

if (!function_exists('is_moderate')) {
    /**
     * Находится ли текущий авторизованный пользователь на модерации
     *
     * @return boolean
     */
    function is_moderate()
    {
        return current_user() !== null && current_user()->isModerate();
    }
}

if (!function_exists('validation_errors')) {
    function validation_errors($clear = true)
    {
        if ($clear) {
            return request()->session()->pull('errors') ?: new  ViewErrorBag;
        }

        return request()->session()->get('errors') ?: new  ViewErrorBag;
    }
}

if (!function_exists('site_option')) {
    /**
     * Является ли текущий пользователь админом
     *
     * @return mixed
     */
    function site_option($key, $default = null)
    {
        return SiteOption::getValue($key, $default);
    }
}

if (!function_exists('request_filter_array')) {
    /**
     * Является ли текущий пользователь админом
     *
     * @return mixed
     */
    function request_filter_array($key, $default = null)
    {
        return prepare_filter_param(request($key, $default));
    }
}

if (!function_exists('prepare_filter_param')) {
    /**
     * Является ли текущий пользователь админом
     *
     * @return mixed
     */
    function prepare_filter_param($value, $separator = ',')
    {
        if (is_array($value)) {
            return $value;
        } elseif (is_string($value)) {
            return array_filter(explode($separator, $value), function ($value) {
                return ($value !== null && $value !== false && trim($value) !== '');
            });
        }

        return [];
    }
}

if (!function_exists('pusherEvent')) {
    /**
     *
     */
    function pusherEvent(...$events)
    {
        try {
            event($events);
        } catch (Exception $e) {
            Log::error($e->getMessage(), $e->getTrace());
        }
    }
}
