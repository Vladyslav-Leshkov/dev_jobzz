<?php

use App\Http\Controllers\Backend\Content\HtmlBlockController;
use App\Http\Controllers\Backend\Content\PageController;
use App\Http\Controllers\Backend\Content\UploadController;
use Illuminate\Support\Facades\Route;

Route::resource('page', PageController::class);

Route::post('editor/upload', [UploadController::class, 'editor'])
    ->name('editor.upload');

Route::get('html-block', [HtmlBlockController::class, 'index'])->name('html-block.index');
Route::get('html-block/{item}', [HtmlBlockController::class, 'edit'])->name('html-block.edit');
Route::patch('html-block/{item}', [HtmlBlockController::class, 'update'])->name('html-block.update');