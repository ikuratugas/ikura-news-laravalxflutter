<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BeritaController;

Route::get('/', [BeritaController::class, 'index'])->name("index");
Route::get('/create', [BeritaController::class, 'create'])->name("create");
Route::post('/create', [BeritaController::class, 'store'])->name("store");

Route::get('{id}/edit', [BeritaController::class, 'edit'])->name("edit");
Route::put('{id}/update', [BeritaController::class, 'update'])->name("update");
Route::delete('{id}/kampret', [BeritaController::class, 'destroy'])->name("destroy");


// ini route untuk android 
Route::get('/news', [BeritaController::class, 'apiIndex']);