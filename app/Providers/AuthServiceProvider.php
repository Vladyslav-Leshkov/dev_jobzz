<?php

namespace App\Providers;

use App\Models\Job\Invoice;
use App\Models\Job\Vacancy;
use App\Policies\VacancyPolicy;
use App\Policies\InvoicePolicy;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Models\Model' => 'App\Policies\ModelPolicy',
        Vacancy::class => VacancyPolicy::class,
        Invoice::class => InvoicePolicy::class,
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();
        Gate::define('owner-vacancy', [VacancyPolicy::class, 'owner']);
        Gate::define('owner-invoice', [InvoicePolicy::class, 'owner']);
        Gate::define('owner-payout', [InvoicePolicy::class, 'ownerPayout']);
    }
}
