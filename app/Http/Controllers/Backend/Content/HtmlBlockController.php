<?php

namespace App\Http\Controllers\Backend\Content;

use App\Http\Controllers\Controller;
use App\Models\Content\HtmlBlock;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class HtmlBlockController extends Controller
{
    //
    /**
     * Display a listing of the resource.
     *
     * @return Response|View
     */
    public function index(Request $request)
    {
        $items = HtmlBlock::query()->orderBy('admin_title')->get();
        //
        return view('backend.content.html-block.index', ['items' => $items]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param HtmlBlock $item
     *
     * @return Response|View
     */
    public function edit(Request $request, HtmlBlock $item)
    {
        //

        return view('backend.content.html-block.edit', ['item' => $item]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param Request $request
     * @param HtmlBlock $item
     *
     * @return Response
     */
    public function update(Request $request, HtmlBlock $item)
    {
        //
        $item->fill($request->all());
        $item->save();

        return redirect()->route('admin.html-block.index')->withFlashSuccess(__('Record updated.'));
    }
}
