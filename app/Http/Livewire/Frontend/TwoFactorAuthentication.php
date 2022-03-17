<?php

namespace App\Http\Livewire\Frontend;

use Illuminate\Contracts\Foundation\Application;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Livewire\Component;

/**
 * Class TwoFactorAuthentication.
 */
class TwoFactorAuthentication extends Component
{
    /**
     * @var
     */
    public $code;

    /**
     * @param  Request  $request
     *
     * @return mixed
     */
    public function validateCode(Request $request)
    {
        $this->validate([
            'code' => 'required|min:6',
        ]);

        if ($request->user()->confirmTwoFactorAuth($this->code)) {
            $this->resetErrorBag();

            session()->flash('flash_success', __('Two Factor Authentication Successfully Enabled'));

            return redirect()->route('frontend.auth.account.2fa.show');
        }

        $this->addError('code', __('Your authorization code was invalid. Please try again.'));

        return false;
    }

    /**
     * @return Application|Factory|View
     */
    public function render()
    {
        return view('components.frontend.two-factor-authentication');
    }
}
