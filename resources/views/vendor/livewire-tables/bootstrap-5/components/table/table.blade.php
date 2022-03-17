<div class="table-responsive">
    <table class="table table-striped">
        <thead>
            <tr>
                {{ $head }}
            </tr>
        </thead>

        <tbody>
            {{ $body }}
        </tbody>
    </table>

</div>
@include('livewire-tables::bootstrap-5.includes.delete-modal')
