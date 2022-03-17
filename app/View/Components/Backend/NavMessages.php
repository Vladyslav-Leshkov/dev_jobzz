<?php

namespace App\View\Components\Backend;

use Illuminate\Contracts\View\View;
use Illuminate\View\Component;

class NavMessages extends Component
{
    public $messages = [];

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($messages = [])
    {
        // example message
        $this->messages[] = (object)[
            'url'=>'#',
            'time'=>'15m ago',
            'text'=>'This is example message!',
            'user'=> (object)[
                'name'=>'Vanessa Tucker',
                'avatarUrl'=>'/img/avatars/avatar-5.jpg'
            ]
        ];
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return View|string
     */
    public function render()
    {
        return view('components.backend.nav-messages');
    }
}
