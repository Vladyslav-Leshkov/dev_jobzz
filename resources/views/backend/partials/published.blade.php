<div class="form-check form-switch published-switch" data-url="{{$updateUrl}}">
    <input class="form-check-input" type="checkbox" id="model-{{$model->id}}" {{$model->published ? 'checked' : ''}}>
    <label class="form-check-label" for="model-{{$model->id}}"></label>
</div>
