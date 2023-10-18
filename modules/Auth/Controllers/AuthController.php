<?php

namespace Module\Auth\Controllers;

use GuzzleHttp\RedirectMiddleware;
use Module\Auth\Models\AuthModel;
use Module\Auth\Models\UserModel;

class AuthController
{
  // login con email y password
  static public function login($request, $params)
  {
    $correo = $request['correo'];
    $contrasena = $request['contrasena'];

    $errors = [];

    if (!$correo) $errors['correo'] = 'El correo es requerido';
    if (!$contrasena) $errors['contrasena'] = 'La contraseña es requerida';

    if (count($errors) > 0) {
      return new \Exception(array_values($errors)[0]);
    }

    $user = AuthModel::login($correo, $contrasena);

    if (!$user) {
      return new \Exception('Usuario o contraseña incorrectos');
    }

    $_SESSION['user'] = $user;
    return $user;
  }

  static public function register($request, $params)
  {

    // obligatorios
    $nombre = $request['nombre'];
    $correo = $request['correo'];
    $contrasena = $request['contrasena'];

    // no requeridos
    $genero = $request['genero'];
    $direccion = $request['direccion'];
    $telefono = $request['telefono'];

    $errors = [];

    if (!$nombre) $errors['nombre'] = 'El nombre es requerido';
    if (!$correo) $errors['correo'] = 'El correo es requerido';
    if (!$contrasena) $errors['contrasena'] = 'La contraseña es requerida';

    if (count($errors) > 0) {
      return new \Exception(array_values($errors)[0]);
    }

    $user = UserModel::insertNewUser($nombre, $correo, $contrasena, $genero, $direccion, $telefono);
    if (!$user) {
      return new \Exception('Usuario o contraseña incorrectos');
    }

    $_SESSION['user'] = $user;

    $response = [
      'success' => true,
      'message' => 'Usuario registrado correctamente',
      'user' => $user
    ];

    echo json_encode($response);
  }
}
