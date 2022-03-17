<?php

namespace App\Http\Controllers\Frontend\Auth;

use App\Events\User\UserLoggedIn;
use App\Exceptions\GeneralException;
use App\Models\Auth\User;
use App\Services\Backend\Auth\UserService;
use App\Http\Controllers\Controller;
use Exception;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Laravel\Socialite\Facades\Socialite;

/**
 * Class SocialController.
 */
class SocialController extends Controller
{
    /**
     * @param $provider
     *
     * @return \Symfony\Component\HttpFoundation\RedirectResponse
     */
    public function redirect($provider)
    {

        $role = request()->input('role', '');
        session(['user_role' => $role]);
        return Socialite::driver($provider)->with(['role' => $role])->redirect();
    }

    /**
     * @param $provider
     * @param UserService $userService
     *
     * @return RedirectResponse
     * @throws GeneralException
     *
     */
    public function callback($provider, UserService $userService)
    {

        if ($provider === 'linkedin' && request()->has('error')) {
            return redirect()->route('frontend.auth.login')->withFlashDanger(__(request()->input('error_description', 'Auth error')));
        } else {
            $role = request()->input('role', session('user_role', ''));
            try {
                $info = Socialite::driver($provider)->user();
                Log::info('Socialite info', (array)$info);
                if (empty($role) && $userService->userProviderExist($info, $provider) === null) {
                    return redirect()->route('frontend.auth.login')->withFlashDanger(__('Account not found. Please register.'));
                }

                $user = $userService->registerProvider($info, $provider, $role);

                if ($user->deleted_at !== null) {
                    Auth::logout();
                    return redirect()->route('frontend.auth.login')->withFlashDanger(__('Your account has been deleted.'));
                }

                $user = User::query()->where('email', $user->email)->firstOrFail();


                Auth::guard('web')->login($user);
                session()->regenerate();

                //event(new UserLoggedIn($user));
                if ($provider === 'google') {
                    //Log::info('Socialite user', Auth::getUser());
                    //Log::info('Socialite session', session()->all());
                }
                return redirect()->route(homeRoute());
            } catch (Exception $exception) {
                Log::info($exception->getMessage(), $exception->getTrace());
                return redirect()->route('frontend.auth.login')->withFlashDanger(__(request()->input('error_description', 'Auth error')));
            }

        }

    }

    public function test()
    {
        $user = User::query()->where('email', 'vadox.dev@gmail.com')->first();
        Auth::guard('web')->login($user);
        //event(new UserLoggedIn($user));
        return redirect()->route(homeRoute());
    }
}
