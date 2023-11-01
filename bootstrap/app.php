<?php 

  define('PROJECT', true);

  // load .env file
  $dotenv = Dotenv\Dotenv::createImmutable(__DIR__.'/../');
  $dotenv->safeLoad();

  // load helpers
  const helpers_dir = __DIR__.'/../helpers';
  $helpers = scandir(helpers_dir);
  foreach ($helpers as $helper) {
    if ($helper != '.' && $helper != '..') {
      require_once helpers_dir.'/'.$helper;
    }
  }

  use Core\MysqlPDO;
  MysqlPDO::init();