@if ($logged_in_user->isMasterAdmin())


    @if($user->trashed())

        {{--        <x-utils.form-button--}}
        {{--            :action="route('admin.user.restore', $user)"--}}
        {{--            method="patch"--}}
        {{--            button-class="btn btn-outline-success btn-sm me-2"--}}
        {{--            icon="fas fa-sync-alt"--}}
        {{--            name="confirm-item"--}}
        {{--            :title="__('Restore')"--}}
        {{--        >--}}
        {{--            @lang('Restore')--}}
        {{--        </x-utils.form-button>--}}
        {{--        @if ($user->id !== $logged_in_user->id && !$user->isMasterAdmin() && !$user->isMasterSupport())--}}
        {{--            <x-utils.delete-button :href="route('admin.user.permanently-delete', $user)" :text="__('Permanently Delete')" />--}}
        {{--        @endif--}}
    @else
        <x-utils.view-button :href="route('admin.user.show', $user)" class="me-2" text=""/>

        <x-utils.link
                :href="route('admin.user.change-password', $user)"
                class="btn btn-outline-warning btn-sm me-2"
                :title="__('Change Password')"
                text=""
        ><i class="fa fa-key"></i></x-utils.link>


        <x-utils.edit-button class="me-2" :href="route('admin.user.edit', $user)" text=""/>

        @if($user->isActive() && !$user->isMasterAdmin() && !$user->isMasterSupport())
            <x-utils.form-button
                :action="route('admin.user.mark', [$user, 3])"
                method="patch"
                name="confirm-item"
                button-class="btn btn-outline-danger btn-sm me-2"
                :title="__('Block')"
            >
                <i class="fa fa-lock"></i>
            </x-utils.form-button>
        @endif

        @if ($user->isBlocked())
            <x-utils.form-button
                :action="route('admin.user.mark', [$user, 1])"
                method="patch"
                button-class="btn btn-outline-success btn-sm me-2"
                icon="fas fa-lock-open"
                name="confirm-item"
                :title="__('Reactivate')"
            >
                @lang('Reactivate')
            </x-utils.form-button>

        @endif
        @if ($user->id !== $logged_in_user->id && !$user->isMasterAdmin() && !$user->isMasterSupport())
        <x-utils.delete-button :href="route('admin.user.destroy', $user)" text="" />
        @endif
    @endif


@endif
