<?php

namespace App\Http\Controllers\Backend\Content;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class UploadController extends Controller
{
    //

    public function editor(Request $request)
    {
        if ($request->hasFile('file')) {
            $fileImage = $request->file('file');
            $location = $fileImage->store("/uploads/editor", 'public');

            return response()->json(['result'=>'OK', 'location'=>Storage::url($location)]);
        }
        abort(401, 'invalid file');
    }
}
