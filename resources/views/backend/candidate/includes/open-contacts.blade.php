@if($model->open_datas_count > 0)
    <a href="{{route('admin.candidate.open-data', ['user'=>$model, 'return_to'=>request()->fullUrl()])}}"
       class="badge bg-primary">{{$model->open_datas_count}}</a>
@else
    <span class="badge bg-secondary">{{$model->open_datas_count}}</span>
@endif
