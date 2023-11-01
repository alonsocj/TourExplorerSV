<?php

namespace Module\Auth\Routes;

use App\Routes\Route;
use Module\User\Controllers\UserController;

Route::get('/panel/usuarios', [UserController::class, 'renderIndex']);

Route::get('/panel/usuarios/{id}', [UserController::class, 'show']);

Route::post('/panel/usuarios', [UserController::class, 'store']);

Route::put('/panel/usuarios/{id}/password', [UserController::class, 'updatePassword']);

Route::put('/panel/usuarios/{id}', [UserController::class, 'update']);

Route::delete('/panel/usuarios/{id}', [UserController::class, 'destroy']);