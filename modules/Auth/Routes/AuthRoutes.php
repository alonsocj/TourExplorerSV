<?php

namespace Module\Auth\Routes;

use App\Routes\Route;
use Module\Auth\Middlewares\AuthMiddleware;
use Module\Auth\Controllers\AuthController;

// views
Route::get('/login', [AuthController::class, 'viewLogin'], [AuthMiddleware::class]);

Route::get('/register', [AuthController::class, 'viewRegister']);


// api
Route::post('/login', function () {
  return AuthController::login($_POST, []);
});

Route::post('/register', function () {
  return AuthController::register($_POST, []);
});
