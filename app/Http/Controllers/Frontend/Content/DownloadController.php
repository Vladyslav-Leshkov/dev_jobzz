<?php

namespace App\Http\Controllers\Frontend\Content;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DownloadController extends Controller
{
    //
    public function download(Request $request)
    {
        $file = $request->input('file');
        if (Storage::exists($file)) {
            return response()->download(Storage::path($file), $request->input('name', null));
        }
        abort(404, __('File not found'));
    }
}
