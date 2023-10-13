<?php

namespace Module\Auth\Controllers;

use GuzzleHttp\RedirectMiddleware;
use Module\Auth\Models\AuthModel;

class AuthController
{
  // login con email y password
  public function login($request, $params)
  {
    if (!isset($request['email']) && !isset($request['password'])) {
      return view('auth.login');
    }

    $user = AuthModel::login($request['email'], $request['password']);

    if ($user) {
      $_SESSION['user'] = $user;
      return $user;
    }

    return new \Exception('Usuario o contraseña incorrectos');
    
  }
}
