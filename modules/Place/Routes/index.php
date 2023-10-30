<?php

  namespace Module\Place;

  use App\Routes\Route;

  use Module\Place\Controllers\PlaceController;

  Route::get('/lugares', [PlaceController::class, 'index']);

  Route::post('/lugares', [PlaceController::class, 'store']);

  Route::put('/lugares/{id}', [PlaceController::class, 'update']);

  Route::delete('/lugares/{id}', [PlaceController::class, 'destroy']);

  