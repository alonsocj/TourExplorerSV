<?php

// autocarga de clases con PSR-4
require __DIR__ . '/vendor/autoload.php';

$smarty = new Smarty();
$smarty->setTemplateDir('./views/layouts');
$smarty->assign('name', 'Ned');
$smarty->display('master.tpl');

