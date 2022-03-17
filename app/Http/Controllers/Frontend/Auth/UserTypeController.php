<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Http\Controllers\Controller;
use App\Models\Auth\User;
use Illuminate\Http\Request;

class UserTypeController extends Controller
{
    //

    public function index()
    {
        return view('frontend.auth.type');
    }


    public function store(Request $request)
    {
        $role = $request->input('role', '');
        if($role !== User::TYPE_CANDIDATE && $role !== User::TYPE_RECRUITER){
            abort(400, 'Не верный запрос');
        }
        $user = current_user();
        $user->type = $role;
        $user->save();
        $user->syncRoles([$role]);
        return redirect()->route('frontend.profile.wizard.index')->withFlashSuccess(__('Please fill in your profile.'));
    }
}
