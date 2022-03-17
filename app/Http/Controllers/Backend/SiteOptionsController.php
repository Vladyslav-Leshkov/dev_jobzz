<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Common\SiteOption;
use Illuminate\Http\Request;

class SiteOptionsController extends Controller
{
    //
    public function index()
    {
        $site_options = SiteOption::all();

        return view('backend.site-options.index', ['site_options'=>$site_options]);
    }


    public function update(Request $request)
    {
        $options = $request->input('options', []);

        foreach ($options as $key=>$value) {
            $option = SiteOption::query()->where('key', $key)->first();
            if ($option) {
                $option->value = $value;
                $option->save();
            }
        }


        SiteOption::clearCache();

        return redirect()->back()->with('success', __('Updated'));
    }
}
