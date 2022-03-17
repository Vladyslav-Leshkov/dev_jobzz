<?php

namespace App\Http\Controllers\Frontend\Profile;

use App\Http\Controllers\Controller;
use App\Models\Job\NotifySettings;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class ProfileSettingsController extends Controller
{
    //

    public function index()
    {

        $settings = current_user()->notifySettings;
        if ($settings === null) {
            $settings = new NotifySettings();
            $settings->user_id = current_user()->id;
            $settings->email_notify = 1;
            $settings->save();
        }

        return view('frontend.profile.settings.index', ['settings' => $settings]);
    }


    public function update(Request $request)
    {
        $settings = current_user()->notifySettings;
        if ($settings === null) {
            $settings = new NotifySettings();
            $settings->user_id = current_user()->id;
        }
        $settings->fill($request->all());
        $settings->save();
        return redirect()->route('frontend.profile.settings.index')->withFlashSuccess(__('Settings updated'));
    }
}
