<?php

use App\Http\Controllers\Backend\Content\MenuController;
use App\Http\Controllers\Backend\Content\MenuItemController;

Route::resource('menus', MenuController::class);
Route::post('menus/{menu}/menu-items/sort', [MenuItemController::class, 'sort']);
Route::resource('menus.menu-items', MenuItemController::class);

