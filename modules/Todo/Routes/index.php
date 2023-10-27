<?php

  namespace Module\Todo;

  use App\Routes\Route;

  use Module\Todo\Controllers\TodoController;

  Route::get('/todos', [TodoController::class, 'index']);

  Route::post('/todos', [TodoController::class, 'store']);

  Route::put('/todos/{id}', [TodoController::class, 'update']);

  Route::delete('/todos/{id}', [TodoController::class, 'destroy']);

  