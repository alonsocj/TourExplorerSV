<?php

namespace Module\Tour\Routes;

use App\Routes\Route;
use Module\Tour\Controllers\TourController;

Route::get('/tours',[TourController::class,'index']);


Route::post('/tours', [TourController::class, 'store']);