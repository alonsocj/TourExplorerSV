<?php

  namespace Module\Place;

  use App\Routes\Route;

  use Module\Place\Controllers\PlaceController;
  use Module\Place\Controllers\ImageController;

  Route::get('/panel/lugares', [PlaceController::class, 'index']);

  Route::get('/panel/lugares/{lugar}/imagenes', [ImageController::class, 'index']);
  Route::post('/panel/lugares/{lugar}/imagenes', [ImageController::class, 'store']);
  Route::delete('/panel/lugares/{lugar}/imagenes/{id}', [ImageController::class, 'destroy']);

  Route::get('/panel/lugares/{id}', [PlaceController::class, 'show']);

  Route::post('/panel/lugares', [PlaceController::class, 'store']);

  Route::put('/panel/lugares/{id}', [PlaceController::class, 'update']);

  Route::delete('/panel/lugares/{id}', [PlaceController::class, 'destroy']);

  