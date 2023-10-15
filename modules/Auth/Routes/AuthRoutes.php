<?php 

  namespace Module\Auth\Routes;

  use App\Routes\Route;
  use Module\Auth\Middlewares\AuthMiddleware;

  Route::get('/test', function () {
    return view('auth.login', ['nombre' => 'Cristian', 'edad' => 26]);
  }, AuthMiddleware::class);

  Route::put('/test-test', function ($request, $arg) {
    echo 'Hola mundo';
  });