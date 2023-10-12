<?php
  namespace Module\Auth;

  class ModuleProvider extends \App\AppProvider {
    
    public function __construct()
    {
      $this->loadRoutes(__DIR__ . '/Routes/AuthRoutes.php');
    }

  }