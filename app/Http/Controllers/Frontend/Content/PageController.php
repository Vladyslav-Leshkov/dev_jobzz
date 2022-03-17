<?php

namespace App\Http\Controllers\Frontend\Content;

use App\Http\Controllers\Controller;
use App\Models\Content\Page;

class PageController extends Controller
{
    //

    public function show($slug)
    {
        $pageContent = Page::query()->published()->where('slug', $slug)->firstOrFail();

        return view('frontend.content.page', ['pageContent'=>$pageContent]);
    }
}
