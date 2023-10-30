<?php
  namespace Module\Tour;

  class ModuleProvider extends \App\AppProvider {
    public function __construct()
    {
      $this->loadRoutes(__DIR__ . '/Routes/index.php');
    }

  }      // $this->loadRoutes(__DIR__ . '/Routes/AuthRoutes.php');
