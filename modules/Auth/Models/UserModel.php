<?php

namespace Module\Auth\Models;

use Core\MysqlPDO;

class UserModel
{
  const TABLE_USERS = 'usuarios';

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
}
