<?php

namespace Module\Auth\Routes;

use App\Routes\Route;
use Module\Auth\Controllers\AuthController;

// views
Route::get('/login', [AuthController::class, 'renderLogin']);

Route::get('/register', [AuthController::class, 'renderRegister']);

// api
Route::post('/login', [AuthController::class, 'login']);

// Route::post('/register', function () {
//   return AuthController::register($_POST, []);
// });

Route::post('/registrar', [AuthController::class,'registrar']);

Route::post('/logout', [AuthController::class, 'logout']);
