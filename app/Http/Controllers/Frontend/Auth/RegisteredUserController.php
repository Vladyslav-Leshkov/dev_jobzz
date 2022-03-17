<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\RegisterRequest;
use App\Models\Auth\Role;
use App\Models\Auth\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Contracts\View\View;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @param string|null $role
     *
     * @return View
     */
    public function create(string $role = User::TYPE_CANDIDATE): View
    {
        if ($role !== User::TYPE_CANDIDATE && $role !== User::TYPE_RECRUITER) {
            abort(404);
        }

        return view('frontend.auth.register', ['role' => $role]);
    }

    /**
     * Handle an incoming registration request.
     *
     * @param RegisterRequest $request
     * @param string $role
     *
     * @return RedirectResponse
     */
    public function store(RegisterRequest $request, string $role = User::TYPE_CANDIDATE)
    {
        if ($role !== User::TYPE_CANDIDATE && $role !== User::TYPE_RECRUITER) {
            abort(404);
        }

        /**
         * @var User $user
         */
        $user = User::create([
            'email' => trim($request->email),
            'password' => Hash::make($request->password),
            'type' => $role,
            'status' => User::STATUS_INACTIVE,
            'agree' => $role === User::TYPE_RECRUITER ? 0 : 1,
        ]);

        $role = Role::findByType($role);
        $user->assignRole($role);
        Auth::login($user);

        event(new Registered($user));

        return redirect(RouteServiceProvider::HOME)->withFlashSuccess(__('A confirmation link has been sent to your email address.'));
    }
}
