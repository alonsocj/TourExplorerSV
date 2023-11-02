<?php 

  namespace Module\Landing\Routes;

  use App\Routes\Route;
  use Module\Landing\Controllers\HomeController;

  Route::get('/', [HomeController::class, 'index']);

  Route::get('/tours/{id_tour}', [HomeController::class, 'showTour']);
  Route::post('/tours/{id_tour}/reservar', [HomeController::class, 'reservarTour']);
  Route::post('/tours/{id_tour}/reservar/cancelar', [HomeController::class, 'cancelarReservarTour']);
  Route::get('/tours-antiguos', [HomeController::class, 'showOldTours']);
  Route::get('/perfil', [HomeController::class, 'showProfile']);
