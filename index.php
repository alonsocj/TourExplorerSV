<?php

  // autocarga de clases con PSR-4

  use Module\Auth\ModuleProvider;

  require __DIR__.'/vendor/autoload.php';

  // exist const PROJECT
  if (!defined('PROJECT')) {
    require_once __DIR__ . '/bootstrap/app.php';
  }

  $modules_dir = __DIR__.'/modules';

  $modules = array_filter(glob(__DIR__ . '/modules/*'), 'is_dir');

  foreach ($modules as $module) {
    $relative_path = explode('/modules/', $module);
    $moduleProvider = 'Module\\'.$relative_path[1].'\\ModuleProvider';
    $moduleProvider = new $moduleProvider();
  }


  \App\Routes\Route::execDispatcher();