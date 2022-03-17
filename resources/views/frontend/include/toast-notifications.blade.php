<div class="toast-container position-fixed  end-0 p-3" style="bottom: 53px;">
    @if(session()->get('flash_success'))
        <x-utils.toast type="success">{{ session()->get('flash_success') }}</x-utils.toast>
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
        <x-utils.toast type="success">{{ session()->get('status') }}</x-utils.toast>
    @endif

    @if(session()->get('resent'))
        <x-utils.toast type="success"> @lang('A fresh verification link has been sent to your email address.')</x-utils.toast>
    @endif

    @if(session()->get('verified'))
        <x-utils.toast type="success"> @lang('Thank you for verifying your e-mail address.')</x-utils.toast>
    @endif

    @if(isset($errors) && $errors->any())
        <x-utils.toast type="danger">{!! implode('<br>', $errors->all() )!!}</x-utils.toast>
    @endif
</div>

