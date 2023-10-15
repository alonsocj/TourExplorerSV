<?php

  namespace Module\Auth\Middlewares;

  class AuthMiddleware {
    public function __invoke($routeInfo)
    {
      return true;
    }
  }