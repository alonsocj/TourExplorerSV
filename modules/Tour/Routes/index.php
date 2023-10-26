<?php

namespace Module\Tour\Routes;

use App\Routes\Route;
use Module\Tour\Controllers\TourController;

Route::get('/tourHistory',[TourController::class,'index']);