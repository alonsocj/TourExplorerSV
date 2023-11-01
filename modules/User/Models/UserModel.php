<?php

namespace Module\User\Models;

use Core\MysqlPDO;
use Module\Rol\Models\RolModel;

class UserModel
{
  const TABLE_USERS = 'usuarios';

  static public function index()
  {
    return MysqlPDO::find(self::TABLE_USERS);
  }

  static public function create($columns) {
    try {
      $user = MysqlPDO::insert(self::TABLE_USERS, $columns);
      return $user;
    } catch (\Exception $e) {
      return null;
    }
  }

  static public function existeUsuario($email) {
    try {
      $user = MysqlPDO::findOne(self::TABLE_USERS, ['*'], ['correo' => $email]);
      return $user;
    } catch (\Exception $e) {
      return null;
    }
  }

  static public function insertNewUser($nombre, $correo, $contrasena, $genero, $direccion, $telefono)
  {
    try {
      $fields = [
        'nombre' => $nombre,
        'correo' => $correo,
        'contrasena' => $contrasena,
        'genero' => $genero,
        'direccion' => $direccion,
        'telefono' => $telefono
      ];

      $emailExists = MysqlPDO::findOne(self::TABLE_USERS, ['*'], ['correo' => $correo]);
      if($emailExists) return new \Exception('El correo ya existe');

      MysqlPDO::insert(self::TABLE_USERS, $fields);

      $user = MysqlPDO::findOne(self::TABLE_USERS, ['*'], ['correo' => $correo, 'contrasena' => $contrasena]);

      return $user;
    } catch (\Exception $e) {
      return $e->getMessage();
    }
  }

  static public function actualizarUsuario($id, $columns) {
    try {
      $user = MysqlPDO::update(self::TABLE_USERS, $columns, ['id_usuario' => $id]);
      return $user;
    } catch (\Exception $e) {
      return null;
    }
  }

  static public function obtenerUsuario ($email) {
    try {
      $user = MysqlPDO::findOne(self::TABLE_USERS, ['*'], ['correo' => $email]);
      if (!$user) return null;
      $rol = RolModel::getRolById($user['id_rol']);
      $user['rol'] = $rol;
      return $user;
    } catch (\Exception $e) {
      return null;
    }
  }

  static public function obtenerUno ($id_usuario) {
    try {
      $user = MysqlPDO::findOne(self::TABLE_USERS, ['*'], ['id_usuario' => $id_usuario]);
      if (!$user) return null;
      $rol = RolModel::getRolById($user['id_rol']);
      $user['rol'] = $rol;
      return $user;
    } catch (\Exception $e) {
      return null;
    }
  }

  static public function borrarUsuarioPorId($id_usuario) {
    try {
      $user = MysqlPDO::deleteOne(self::TABLE_USERS, ['id_usuario' => $id_usuario]);
      return $user;
    } catch (\Exception $e) {
      return null;
    }
  }

}
