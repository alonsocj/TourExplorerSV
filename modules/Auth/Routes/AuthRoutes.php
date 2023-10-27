<?php 

  namespace Module\Auth\Routes;

  use App\Routes\Route;
  use Module\Auth\Middlewares\AuthMiddleware;
  use Moule\Auth\Controllers\AuthController;

  Route::get('/signin', [AuthController::class, 'signin']);
  Route::get('/singin',[AuthController::class, 'signup']);