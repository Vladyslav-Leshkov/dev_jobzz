<?php

namespace App\Listeners\Auth;

use App\Events\Role\RoleCreated;
use App\Events\Role\RoleDeleted;
use App\Events\Role\RoleUpdated;
use Illuminate\Events\Dispatcher;

/**
 * Class RoleEventListener.
 */
class RoleEventListener
{
    /**
     * @param $event
     */
    public function onCreated($event)
    {
    }

    /**
     * @param $event
     */
    public function onUpdated($event)
    {
    }

    /**
     * @param $event
     */
    public function onDeleted($event)
    {
    }

    /**
     * Register the listeners for the subscriber.
     *
     * @param Dispatcher $events
     */
    public function subscribe($events)
    {
        $events->listen(
            RoleCreated::class,
            'App\Listeners\Auth\RoleEventListener@onCreated'
        );

        $events->listen(
            RoleUpdated::class,
            'App\Listeners\Auth\RoleEventListener@onUpdated'
        );

        $events->listen(
            RoleDeleted::class,
            'App\Listeners\Auth\RoleEventListener@onDeleted'
        );
    }
}
