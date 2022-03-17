<?php

namespace App\Http\Controllers\Backend\Content;

use App\Http\Controllers\Controller;
use App\Models\Content\Menu;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class MenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return View
     */
    public function index(Request $request)
    {
        //
        $menus = Menu::all();
        return view('backend.content.menu.index', ['menus' => $menus]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return View
     */
    public function create()
    {
        //
        $menu = new Menu();
        return view('backend.content.menu.create', [ 'menu' => $menu ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        //
        $menu = new Menu();
        $menu->fill($request->all());
        return redirect()->route('admin.menu.index')->withFlashSuccess(__('Record created'));
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param Menu $menu
     * @return View
     */
    public function edit(Menu $menu)
    {
        //
        return view('backend.content.menu.edit', [ 'menu' => $menu ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Menu $menu
     * @return Response
     */
    public function update(Request $request, Menu $menu)
    {
        //
        $menu->fill($request->all());
        return redirect()->route('admin.menu.index')->withFlashSuccess(__('Record updated'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Menu $menu
     * @return Response
     */
    public function destroy(Menu $menu)
    {
        //
        $menu->delete();
        return redirect()->route('admin.menu.index')->withFlashSuccess(__('Record deleted'));
    }
}
