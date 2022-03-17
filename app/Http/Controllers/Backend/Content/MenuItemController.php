<?php

namespace App\Http\Controllers\Backend\Content;

use App\Http\Controllers\Controller;
use App\Models\Content\Menu;
use App\Models\Content\MenuItem;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class MenuItemController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return View
     */
    public function index(Menu $menu)
    {
        //
        $menuItems = $menu->items;
        return view('backend.content.menu-item.index', [ 'menuItems' => $menuItems, 'menu'=>$menu ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return View
     */
    public function create(Menu $menu)
    {
        //
        $menuItem = new MenuItem();
        $menuItem->menu_id = $menu->id;
        return view('backend.content.menu-item.create', [ 'menuItem' => $menuItem, 'menu'=>$menu ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request, Menu $menu)
    {
        $menuItem = new MenuItem();
        $menuItem->fill($request->all());
        $menuItem->menu_id = $menu->id;
        $menuItem->save();
        return redirect()->route('admin.menu.items.index', $menu)->withFlashSuccess(__('Record created'));
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param MenuItem $menuItem
     * @return View
     */
    public function edit(MenuItem $menuItem, Menu $menu)
    {
        //
        return view('backend.content.menu-item.edit', [ 'menuItem' => $menuItem, 'menu'=>$menu ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param MenuItem $menuItem
     * @return Response
     */
    public function update(Request $request, Menu $menu, MenuItem $menuItem)
    {
        //
        $menuItem->fill($request->all());
        $menuItem->save();
        return redirect()->route('admin.menu.items.index', $menu)->withFlashSuccess(__('Record created'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param MenuItem $menuItem
     * @return Response
     */
    public function destroy(Menu $menu, MenuItem $menuItem)
    {
        //
        $menuItem->delete();
        return redirect()->route('admin.menu.items.index', $menu)->withFlashSuccess(__('Record deleted'));
    }
}
