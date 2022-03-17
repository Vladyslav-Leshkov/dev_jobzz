<?php

namespace App\Providers;

use App\Models\Auth\User;
use App\Models\Job\Invoice;
use App\Models\Job\Payout;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

/**
 * Class ComposerServiceProvider.
 */
class ComposerServiceProvider extends ServiceProvider
{
    /**
     * Register bindings in the container.
     *
     * @param
     */
    public function boot()
    {
        View::composer('*', function ($view) {
            $view->with('logged_in_user', auth()->user());
        });

        View::composer('*', function ($view) {
            $view->with('trans_locale', request()->input('trans_locale', app()->getLocale()));
        });

        View::composer('*', function ($view) {
            $view->with('site_languages', config('site-settings.locale.languages'));
        });

        View::composer('backend.include.sidebar', function ($view) {
            $view->with('moderate_recruiter_count', User::recruiters()->onlyModerate()->count());
            $view->with('moderate_candidate_count', User::candidates()->onlyModerate()->count());
            $view->with('late_payouts_count', Payout::toDanger()->count());
            $view->with('late_invoices_count', Invoice::whereHas('payouts', function ($q) {
                return $q->toDanger();
            })->count());
        });
    }
}
