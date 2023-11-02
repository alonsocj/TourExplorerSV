<?php 

  namespace Module\Landing\Routes;

  use App\Routes\Route;
  use Module\Landing\Controllers\HomeController;

  Route::get('/', [HomeController::class, 'index']);

  Route::get('/tours/{id_tour}', [HomeController::class, 'showTour']);