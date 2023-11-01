<?php

namespace Module\Tour\Routes;

use App\Routes\Route;
use Module\Tour\Controllers\TourController;

Route::get('/panel/tours',[TourController::class,'index']);
Route::get('/panel/tours/crear',[TourController::class,'create']);
Route::get('/panel/tours/{id}/editar', [TourController::class, 'editar']);


Route::post('/panel/tours', [TourController::class, 'store']);


Route::post('/panel/tours/{id}/imagen', [TourController::class, 'borrarImagen']);
Route::post('/panel/tours/{id}', [TourController::class, 'update']);
Route::delete('/panel/tours/{id}', [TourController::class, 'destroy']);