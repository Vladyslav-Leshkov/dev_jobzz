<div class="d-flex flex-wrap">
    @foreach ($menus as $menu)
        <div class="card mx-10" style="max-width: 450px;">
            <div class="card-header border-bottom-1">
                <h2>{{ $menu->title }}</h2>
            </div>
            <ul wire:sortable="updateMenuOrder" class="list-group list-group-flush draggable-container menu-sortable">
                @foreach ($menu->items()->orderBy('position')->get() as $menuItem)
                    <li class="list-group-item draggable" wire:key="menu-item-{{ $menuItem->id }}"
                        wire:sortable.item="{{ $menuItem->id }}">
                        @if($selectedItem !== null && $selectedItem->id === $menuItem->id)
                            <form class="d-block w-100"
                                  wire:submit.prevent="updateMenuItem({{ $menuItem->id }}, $event.target.title.value, $event.target.slug.value, $event.target.side.value)">
                                <select name="side" id="side" class="form-control form-control-sm mb-2">
                                    <option value="0" {{(int)$menuItem->side === 0 ? 'checked' : ''}}>Слева</option>
                                    <option value="2" {{(int)$menuItem->side === 2 ? 'checked' : ''}}>Справа</option>
                                </select>
                                <input type="text" class="form-control form-control-sm mb-2" required
                                       placeholder="@lang('Title')" name="title"
                                       value="{{$menuItem->getTranslation('title', $locale)}}">
                                <input type="text" class="form-control form-control-sm mb-2" required
                                       placeholder="@lang('Url')" name="slug" value="{{$menuItem->slug}}">
                                <button class="btn btn-sm btn-primary me-2">@lang('Save')</button>
                                <button class="btn btn-sm btn-secondary"
                                        wire:click.prevent="cancelEdit()">@lang('Cancel')</button>
                            </form>
                        @else
                            <div class="d-flex align-items-center">
                                <div wire:sortable.handle class="draggable-handle me-3">
                                    <div class="fa fa-bars"></div>
                                </div>
                                <div>
                                    <div class="fw-bold">
                                        {{ $menuItem->getTranslation('title', $locale) }}
                                        <span class="text-muted">({{(int)$menuItem->side === 2 ? 'справа' : 'слева' }})</span>
                                    </div>
                                    <div class="text-muted">{{ $menuItem->slug }}</div>

                                </div>
                                <div class="ms-auto d-flex align-items-center">
                                    <div class="form-check form-switch me-3">
                                        <input wire:change="toggleMenuItemActive({{ $menuItem->id }}, $event.target.checked)"
                                               class="form-check-input"
                                               {{$menuItem->active ? 'checked' : ''}} type="checkbox"
                                               id="menu-item-active-{{$menuItem->id}}">
                                        <label class="form-check-label"
                                               for="menu-item-active-{{$menuItem->id}}"></label>
                                    </div>

                                    <button wire:click.prevent="editMenuItem({{ $menuItem->id }})"
                                            class="btn btn-sm btn-primary me-2"><i class="fas fa-edit"></i></button>
                                    <button wire:click.prevent="deleteMenuItem({{ $menuItem->id }})"
                                            class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></button>
                                </div>
                            </div>

                        @endif

                    </li>
                @endforeach
            </ul>

            <form class="card-footer border-top-1"
                  wire:submit.prevent="createMenuItem({{ $menu->id }}, $event.target.title.value, $event.target.slug.value, $event.target.side.value)">
                <select name="side" id="side" class="form-control form-control-sm mb-2">
                    <option value="0">Слева</option>
                    <option value="2">Справа</option>
                </select>
                <input type="text" class="form-control form-control-sm mb-2" required placeholder="@lang('Title')"
                       name="title">
                <input type="text" class="form-control form-control-sm mb-2" required placeholder="@lang('Url')"
                       name="slug">
                <button class="btn btn-sm btn-primary">Add Menu Item</button>
            </form>
        </div>

    @endforeach

</div>

