<x-utils.edit-button
    :href="route('admin.translation.edit', array_merge(request()->all(), ['line'=>$language_line->id]))" text=""/>
@if(current_user()->isMasterAdmin())
    <x-utils.delete-button
        :href="route('admin.translation.destroy', ['line'=>$language_line->id, 'return_to'=>route('admin.translation.index', request()->all())])"
        text=""/>
@endif
