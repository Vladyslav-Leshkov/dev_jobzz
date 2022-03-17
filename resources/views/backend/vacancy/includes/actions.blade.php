@if($vacancy->trashed())
    <x-utils.form-button
            :action="route('admin.vacancy.restore', $vacancy)"
            method="patch"
            button-class="btn btn-outline-success btn-sm me-2"
            icon="fas fa-sync-alt"
            name="confirm-item"
            :title="__('Restore')"
    >
        @lang('Restore')
    </x-utils.form-button>

    <x-utils.delete-button :href="route('admin.vacancy.permanently-delete', $vacancy)"
                           :text="__('Permanently Delete')"/>
@else
    @if($vacancy->status !== \App\Models\Job\Vacancy::STATUS_BLOCKED)
        <x-utils.view-button :href="route('frontend.vacancy.show', $vacancy)" target="_blank" class="me-2" text=""/>
        @if($vacancy->status === \App\Models\Job\Vacancy::STATUS_ARCHIVED)
            <x-utils.form-button
                    :action="route('admin.vacancy.status', [$vacancy, \App\Models\Job\Vacancy::STATUS_ACTIVE])"
                    method="patch"
                    button-class="btn btn-outline-success btn-sm me-2"
                    icon="fas fa-check"
                    name="confirm-item"
                    :title="__('Publish')"
            >
            </x-utils.form-button>
        @endif
        <x-utils.form-button
                :action="route('admin.vacancy.status', [$vacancy, \App\Models\Job\Vacancy::STATUS_BLOCKED])"
                method="patch"
                name="confirm-item"
                button-class="btn btn-outline-danger btn-sm me-2"
                :title="__('Block')"
        >
            <i class="fa fa-lock"></i>
        </x-utils.form-button>

    @else


        <x-utils.form-button
                :action="route('admin.vacancy.status', [$vacancy, \App\Models\Job\Vacancy::STATUS_ACTIVE])"
                method="patch"
                button-class="btn btn-outline-success btn-sm me-2"
                icon="fas fa-lock-open"
                name="confirm-item"
                :title="__('Reactivate')"
        >
            @lang('Reactivate')
        </x-utils.form-button>
    @endif
    <x-utils.delete-button :href="route('admin.vacancy.destroy', $vacancy)" text=""/>
@endif
