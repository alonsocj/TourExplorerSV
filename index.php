<?php

// autocarga de clases con PSR-4
require __DIR__ . '/vendor/autoload.php';

$smarty = new Smarty();
$smarty->setTemplateDir('./views/layouts');
$smarty->assign('name', 'Ned');
$smarty->display('master.tpl');

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
