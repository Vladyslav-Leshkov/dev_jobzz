<div class="btn-group btn-group-lg mb-3">
    <a href="{{route('admin.user.index')}}" class="btn  {{Route::is('admin.user.index') && $status === 'active' ? 'btn-primary' : 'btn-outline-primary'}}">@lang('Active Users')</a>
    <a href="{{route('admin.user.index', ['status'=>'inactive'])}}" class="btn {{Route::is('admin.user.index') && $status === 'inactive' ? 'btn-primary' : 'btn-outline-primary'}}">@lang('Inactive Users')</a>
    <a href="{{route('admin.user.index', ['status'=>'blocked'])}}" class="btn {{Route::is('admin.user.index') && $status === 'blocked' ? 'btn-primary' : 'btn-outline-primary'}}">@lang('Blocked Users')</a>
    <a href="{{route('admin.user.deleted')}}" class="btn {{Route::is('admin.user.deleted') ? 'btn-primary' : 'btn-outline-primary'}}">@lang('Deleted Users')</a>
</div>
