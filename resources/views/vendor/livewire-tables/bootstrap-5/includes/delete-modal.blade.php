<!-- Modal -->
<div wire:ignore.self class="modal fade" id="deleteModal" tabindex="-1" role="dialog"  aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">@lang('Delete Confirm')</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>@lang('Are you sure you want to delete this entry?')</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary close-btn" data-bs-dismiss="modal">@lang('Close')</button>
                <button type="button" wire:click.prevent="delete()"  class="btn btn-danger close-modal" data-bs-dismiss="modal">@lang('Yes')</button>
            </div>
        </div>
    </div>
</div>
