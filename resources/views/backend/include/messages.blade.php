@if(isset($errors) && $errors->any())
    <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        <div class="alert-message">
            @foreach($errors->all() as $error)
                {{ $error }}<br/>
            @endforeach
        </div>
    </div>
@endif
