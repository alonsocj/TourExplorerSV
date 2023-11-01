<?php

namespace Module\Auth\Middlewares;

class AuthMiddleware
{
  public function __invoke()
  {
    if (!isset($_SESSION['user'])) {
      return view('auth.login');
      exit;
    }
  }

}
