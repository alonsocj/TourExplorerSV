<?php 

namespace Module\User\Controllers;

use Module\User\Models\UserModel;
use Module\Rol\Models\RolModel;
use App\Routes\Response;


class UserController
{

  /**
   * Renderiza la vista de usuarios
   * 
   */
  public function renderIndex ($request) {
    $data = [
      'title' => 'Gestión de usuarios',
      'message' => 'Ejemplo de crud',
      'users' => UserModel::index()
    ];
    return view('user.index', $data);
  }

  /**
   * @param $request
   * @param $params
   * 
   * @return Response
   * 
   * Borra un usuario
   */
  public function destroy ($request, $params) {
    $paramsData = $params['params'];
    $usuario = UserModel::obtenerUno($paramsData['id']);
    if(!$usuario) {
      return Response::json([
        'success' => false,
        'message' => 'Usuario no encontrado'
      ], 400);
    }

    try {
      UserModel::borrarUsuarioPorId($paramsData['id']);
      return Response::json([
        'success' => true,
        'message' => 'Usuario eliminado'
      ], 200);
    } catch (\Throwable $th) {
      return Response::json([
        'success' => false,
        'message' => $th->getMessage()
      ], 400);
    }

  }

  /**
   * @param $request
   * 
   * @return Response
   * 
   * Muestra un usuario
   */
  public function show ($request) {
    $params = $request['params'];

    //code...
    $usuario = UserModel::obtenerUno($params['id']);
    if (!$usuario) {
      return Response::json([
        'success' => false,
        'message' => 'Usuario no encontrado'
      ], 404);
    }

    return Response::json([
      'success' => true,
      'message' => 'Usuario encontrado',
      'data' => $usuario
    ], 200);

  }

  public function update($request, $params) {
    $bodyData = $request['body'];
    $paramsData = $params['params'];

    $usuario =  UserModel::obtenerUno($paramsData['id']);

    if (!$usuario) {
      return Response::json([
        'success' => false,
        'message' => 'Usuario no encontrado'
      ], 404);
    }

    $existeUsuario = UserModel::existeUsuario($bodyData['correo']);
    if ($existeUsuario && $existeUsuario['id_usuario'] != $paramsData['id']) {
      return Response::json([
        'success' => false,
        'message' => 'El correo ya existe'
      ], 400);
    }

    $rol = RolModel::getRolById(htmlentities(addslashes($bodyData['rol'])));
    if (!$rol) {
      return Response::json([
        'success' => false,
        'message' => 'Rol no encontrado'
      ], 404);
    }

    try {
      UserModel::actualizarUsuario($paramsData['id'], [
        "nombre" => htmlentities(addslashes($bodyData['nombre'])),
        "correo" => htmlentities(addslashes($bodyData['correo'])),
        "genero" => htmlentities(addslashes($bodyData['genero'])),
        "direccion" => htmlentities(addslashes($bodyData['direccion'])),
        "telefono" => htmlentities(addslashes($bodyData['telefono'])),
        "id_rol" => $rol['id_rol']
      ]);
      return Response::json([
        'success' => true,
        'message' => 'Usuario actualizado'
      ], 200);
    } catch (\Throwable $th) {
      return Response::json([
        'success' => false,
        'message' => $th->getMessage()
      ], 400);
    }

  }

  public function updatePassword($request, $params) {
    $bodyData = $request['body'];
    $paramsData = $params['params'];

    $usuario =  UserModel::obtenerUno($paramsData['id']);
    if(!$usuario) {
      return Response::json([
        'success' => false,
        'message' => 'Usuario no encontrado'
      ], 404);
    }

    if (password_verify($bodyData['old_password'], $usuario['contrasena'])) {
      UserModel::actualizarUsuario($paramsData['id'], [
        "contrasena" => password_hash($bodyData['new_password'], PASSWORD_DEFAULT)
      ]);
      return Response::json([
        'success' => true,
        'message' => 'Contraseña actualizada'
      ], 200);
    } else {
      return Response::json([
        'success' => false,
        'message' => 'Contraseña incorrecta'
      ], 400);
    }

  }

  public function store($request, $params) {
    $bodyData = $request['body'];

    $rol = RolModel::getRolById(htmlentities(addslashes($bodyData['rol'])));

    $existeUsuario = UserModel::existeUsuario($bodyData['correo']);
    if ($existeUsuario) {
      return Response::json([
        'success' => false,
        'message' => 'El correo ya existe'
      ], 400);
    }

    if (!$rol) {
      return Response::json([
        'success' => false,
        'message' => 'Rol no encontrado'
      ], 404);
    }

    $usuario = UserModel::create([
      "nombre" => htmlentities(addslashes($bodyData['nombre'])),
      "correo" => htmlentities(addslashes($bodyData['correo'])),
      "genero" => htmlentities(addslashes($bodyData['genero'])),
      "direccion" => htmlentities(addslashes($bodyData['direccion'])),
      "telefono" => htmlentities(addslashes($bodyData['telefono'])),
      "id_rol" => $rol['id_rol'],
      "contrasena" => password_hash($bodyData['contrasena'], PASSWORD_DEFAULT)
    ]);

    $usuario = UserModel::obtenerUno($usuario);

    return Response::json([
      'success' => true,
      'message' => 'Usuario creado',
      'data' => $usuario
    ], 200);

  }

}