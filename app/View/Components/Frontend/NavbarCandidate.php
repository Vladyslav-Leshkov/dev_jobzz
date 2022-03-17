<?php

namespace App\View\Components\Frontend;

use App\Models\Content\Menu;
use App\Models\Content\MenuItem;
use App\Models\Job\Vacancy;
use Illuminate\View\Component;

class NavbarCandidate extends Component
{
    public $menu = [];

    public $left_side = [];

    public $right_side = [];

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
        //
        $this->menu = Menu::whereSlug('navbar-candidate')->with(['items' => function($q){
            return $q->where('active', 1);
        }])->first();
        $this->left_side =  $this->menu->items->filter->side(MenuItem::SIDE_LEFT);
        $this->right_side =  $this->menu->items->filter->side(MenuItem::SIDE_RIGHT);
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.frontend.navbar-candidate');
    }
}
