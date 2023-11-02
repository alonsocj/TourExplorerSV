<?php 

  namespace Module\Landing\Routes;

  use App\Routes\Route;
  use Module\Reservar\Controllers\ReservarController;

  Route::get('/panel/reservaciones', [ReservarController::class, 'index']);
  Route::get('/panel/pagos', [ReservarController::class, 'indexPagos']);

  Route::get('/panel/reservaciones/{id_reserva}/editar', [ReservarController::class, 'show']);
  Route::delete('/panel/reservaciones/{id_reserva}', [ReservarController::class, 'destroy']);

  Route::post('/panel/reservaciones/{id_reserva}/pagar', [ReservarController::class, 'pagarTour']);
  Route::post('/panel/reservaciones/{id_reserva}/rechazar', [ReservarController::class, 'rechazarTour']);


