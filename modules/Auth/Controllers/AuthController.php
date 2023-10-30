<?php 

namespace Module\Auth\Controllers;

use Module\User\Models\UserModel;
use App\Routes\Response;

class AuthController
{

  public function renderLogin()
  {
    return view('auth.login');
  }

  public function renderRegister()
  {
    return view('auth.register');
  }

  /**
   * @param $request
   * @param $params
   * 
   * @return Response
   * 
   * Inicia sesion
   */
  public function login($request, $params)
  {
    $bodyData = $request['body'];
    $correo = htmlentities(addslashes($bodyData['correo']));
    $contrasena = htmlentities(addslashes($bodyData['contrasena']));

    $usuario = UserModel::obtenerUsuario($correo);

    if (!$usuario) {
      return Response::json([
        'success' => false,
        'message' => 'Usuario no encontrado'
      ], 404);
    }

    $es_valido = password_verify($contrasena, $usuario['contrasena']);

    if ($es_valido) {

      $_SESSION['id_usuario'] = $usuario['id_usuario'];
      $_SESSION['nombre'] = $usuario['nombre'];
      $_SESSION['correo'] = $usuario['correo'];
      $_SESSION['genero'] = $usuario['genero'];
      $_SESSION['direccion'] = $usuario['direccion'];
      $_SESSION['telefono'] = $usuario['telefono'];
      $_SESSION['rol'] = $usuario['rol'];

      // remover contrasena
      unset($usuario['contrasena']);

      return Response::json([
        'success' => true,
        'message' => 'Usuario logueado correctamente',
        'user' => $usuario
      ], 200);
    } else {
      return Response::json([
        'success' => false,
        'message' => 'Contraseña incorrecta'
      ], 401);
    }
    
  }

  public function registrar ($request, $params) {
    $bodyData = $request['body'];
    $nombre = htmlentities(addslashes($bodyData['nombre']));
    $correo = htmlentities(addslashes($bodyData['correo']));
    $contrasena = htmlentities(addslashes($bodyData['contrasena']));
    $genero = htmlentities(addslashes($bodyData['genero']));
    $direccion = htmlentities(addslashes($bodyData['direccion']));
    $telefono = htmlentities(addslashes($bodyData['telefono']));

    try {
      if (UserModel::existeUsuario($correo)) {
        throw new \Exception('El correo ya existe');
      }
      $usuario = UserModel::create([
        'nombre' => $nombre,
        'correo' => $correo,
        'contrasena' => password_hash($contrasena, PASSWORD_DEFAULT),
        'genero' => $genero,
        'direccion' => $direccion,
        'telefono' => $telefono
      ]);

      if (!$usuario) {
        throw new \Exception('No se pudo registrar el usuario');
      }

      return Response::json([
        'success' => true,
        'message' => 'Usuario registrado correctamente',
        'user' => $usuario
      ], 201);

    } catch (\Throwable $th) {
      return Response::json([
        'success' => false,
        'message' => $th->getMessage()
      ], 400);
    }
    
  }

  public function logout($request, $params)
  {
    session_destroy();
    http_response_code(200);
    header('Location: /login');
  }
}