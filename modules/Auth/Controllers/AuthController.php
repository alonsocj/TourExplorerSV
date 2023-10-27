<?php 

namespace Module\Auth\Controllers;

use Module\Auth\Models\AuthModel;
use Module\Auth\Models\UserModel;

class AuthController
{

  static public function viewLogin()
  {
    return view('auth.login');
  }

  static public function viewRegister()
  {
    return view('auth.register');
  }

  static public function login($request, $params)
  {

    if (!isset($request['correo']) && !isset($request['contrasena'])) {
      http_response_code(400);
      return new \Exception('El correo y la contraseña son requeridos');
    }

    $correo = $request['correo'];
    $contrasena = $request['contrasena'];

    $errors = [];

    if (count($errors) > 0) {
      http_response_code(400);
      return new \Exception(array_values($errors)[0]);
    }

    $user = AuthModel::login($correo, $contrasena);

    if (!$user) {
      http_response_code(401);
      return new \Exception('Usuario o contraseña incorrectos');
    }

    $_SESSION['user'] = $user;
    http_response_code(200);
  }
  static public function register($request, $params)
  {
    http_response_code(400);
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
      return new \Exception('No se pudo registrar el usuario');
    }

    $_SESSION['user'] = $user;

    $response = [
      'success' => true,
      'message' => 'Usuario registrado correctamente',
      'user' => $user
    ];

    http_response_code(200);
    return $response;
  }

  static public function logout($request, $params)
  {
    session_destroy();
    http_response_code(200);
  }
}