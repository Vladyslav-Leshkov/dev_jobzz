<?php

namespace App\View\Components\Backend;

use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class NavNotifications extends Component
{
    public $messages = [];

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
        // example message
        $this->messages[] = (object)[
            'url'=>'#',
            'type'=>'success',
            'icon'=>'home',
            'time'=>'15m ago',
            'text'=>'This is example notification!',
        ];
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return View|string
     */
    public function render()
    {
        return view('components.backend.nav-notifications');
    }
}
