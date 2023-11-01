<?php
  namespace Module\Landing;

  class ModuleProvider extends \App\AppProvider {
    
    public function __construct()
    {
      $this->loadRoutes(__DIR__ . '/Routes/index.php');
    }

  }