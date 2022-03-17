<?php

namespace App\Http\Livewire\Backend;

use App\Models\Content\Menu;
use App\Models\Content\MenuItem;
use Livewire\Component;

class MenuList extends Component
{

    public $menus = [];

    public $selectedItem = null;

    public $locale = 'ru';


    public function mount($locale = 'ru')
    {
        $this->locale = $locale;
        $this->menus = Menu::all();
    }

    public function updateMenuOrder($items)
    {
        foreach ($items as $item) {
            MenuItem::query()->where('id', $item['value'])->update(['position' => $item['order']]);
        }
    }


    public function editMenuItem($item_id)
    {
        $item = MenuItem::findOrFail($item_id);
        $this->selectedItem = $item;
    }

    public function cancelEdit()
    {
        $this->selectedItem = null;
    }

    public function updateMenuItem($item_id, $title, $slug, $side)
    {
        $menu = MenuItem::findOrFail($item_id);
        $menu->setTranslation('title', $this->locale, $title);
        $menu->slug = $slug;
        $menu->side = $side;
        $menu->save();
        $this->selectedItem = null;
    }

    public function createMenuItem($menu_id, $title, $slug, $side)
    {
        $menu = new MenuItem();
        $menu->menu_id = $menu_id;
        $menu->setTranslation('title', $this->locale, $title);
        $menu->slug = $slug;
        $menu->side = $side;
        $menu->position = (MenuItem::where('menu_id', $menu_id)->max('position') ?? 0) + 1;
        $menu->save();
    }

    public function deleteMenuItem($id)
    {
        $menu = MenuItem::findOrFail($id);
        $menu->delete();
    }

    public function toggleMenuItemActive($id, $active)
    {
        $menu = MenuItem::findOrFail($id);
        $menu->active = $active;
        $menu->save();
    }

    public function render()
    {
        return view('livewire.backend.menu-list');
    }
}
