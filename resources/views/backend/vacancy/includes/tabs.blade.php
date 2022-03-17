<div class="btn-group btn-group-lg mb-3">
    <a href="{{route('admin.vacancy.index')}}" class="btn  {{Route::is('admin.vacancy.index') && $status === 'active' ? 'btn-primary' : 'btn-outline-primary'}}">Активные</a>
    <a href="{{route('admin.vacancy.index', ['status'=>'hold'])}}" class="btn {{Route::is('admin.vacancy.index') && $status === 'hold' ? 'btn-primary' : 'btn-outline-primary'}}">Вакансии в холде</a>
    <a href="{{route('admin.vacancy.index', ['status'=>'blocked'])}}" class="btn {{Route::is('admin.vacancy.index') && $status === 'blocked' ? 'btn-primary' : 'btn-outline-primary'}}">Заблокированные</a>
    <a href="{{route('admin.vacancy.index', ['status'=>'archived'])}}" class="btn {{Route::is('admin.vacancy.index') && $status === 'archived' ? 'btn-primary' : 'btn-outline-primary'}}">Архивные</a>
    <a href="{{route('admin.vacancy.index', ['status'=>'anonymous'])}}" class="btn {{Route::is('admin.vacancy.index') && $status === 'anonymous' ? 'btn-primary' : 'btn-outline-primary'}}">Анонимные</a>
    <a href="{{route('admin.vacancy.index', ['status'=>'deleted'])}}" class="btn {{Route::is('admin.vacancy.index') && $status === 'deleted' ? 'btn-primary' : 'btn-outline-primary'}}">Удаленные</a>
</div>
