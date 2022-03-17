<?php

namespace App\Http\Controllers\Backend\Content;

use App\Http\Controllers\Controller;
use App\Models\Content\Page;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class PageController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return Response|View
     */
    public function index(Request $request)
    {
        $pages = Page::query()->orderBy('slug')->get();
        //
        return view('backend.content.page.index', ['pages' => $pages]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response|View
     */
    public function create()
    {
        //
        $page = new Page();

        return view('backend.content.page.create', ['page' => $page]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function store(Request $request)
    {
        //
        $params = $request->all();
        if (isset($params['slug'])) {
            $params['slug'] = ltrim($params['slug'], '/');
        }
        $page = new Page();
        $page->fill($params);
        $page->save();

        return redirect()->route('admin.page.index')->withFlashSuccess(__('Page created.'));
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param Page $page
     *
     * @return Response|View
     */
    public function edit(Request $request, Page $page)
    {
        //

        return view('backend.content.page.edit', ['page' => $page]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param Page $page
     *
     * @return Response
     */
    public function update(Request $request, Page $page)
    {
        //
        $params = $request->all();
        if (isset($params['slug'])) {
            $params['slug'] = ltrim($params['slug'], '/');
        }
        $page->fill($params);
        $page->save();

        return redirect()->route('admin.page.index')->withFlashSuccess(__('Page updated.'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Page $page
     *
     * @return Response
     */
    public function destroy(Request $request, Page $page)
    {
        //
        $page->delete();
        return redirect()->route('admin.page.index')->withFlashSuccess(__('Page deleted.'));
    }
}
