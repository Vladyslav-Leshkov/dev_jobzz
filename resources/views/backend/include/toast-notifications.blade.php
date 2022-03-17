<div class="toast-container position-fixed bottom-0 end-0 p-3">
    @if(session()->get('flash_success'))
        <x-utils.toast type="success" color="white">{{ session()->get('flash_success') }}</x-utils.toast>
    @endif

    @if(session()->get('flash_warning'))
        <x-utils.toast type="warning">{{ session()->get('flash_warning') }}</x-utils.toast>
    @endif

    @if(session()->get('flash_info'))
        <x-utils.toast type="info">{{ session()->get('flash_info') }}</x-utils.toast>
    @endif

    @if(session()->get('flash_message'))
        <x-utils.toast type="info">{{ session()->get('flash_message') }}</x-utils.toast>
    @endif

    @if(session()->get('flash_danger'))
        <x-utils.toast type="danger">{{ session()->get('flash_danger') }}</x-utils.toast>
    @endif

    @if(session()->get('status'))
        <x-utils.toast type="success" color="white">{{ session()->get('status') }}</x-utils.toast>
    @endif

    @if(session()->get('resent'))
        <x-utils.toast type="success"
                       color="white"> @lang('A fresh verification link has been sent to your email address.')</x-utils.toast>
    @endif

    @if(session()->get('verified'))
        <x-utils.toast type="success"> @lang('Thank you for verifying your e-mail address.')</x-utils.toast>
    @endif
</div>

