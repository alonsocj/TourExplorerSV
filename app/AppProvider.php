<?php

  namespace App;

  class AppProvider {

    public function loadRoutes($file_routes)
    {
      require_once $file_routes;
    }
  }