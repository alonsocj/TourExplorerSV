<?php

namespace Module\Auth\Models;

use Core\MysqlPDO;

class AuthModel
{
  const TABLE_USERS = 'usuarios';

  static public function login($correo, $contrasena)
  {
    try {
      $user = MysqlPDO::findOne(self::TABLE_USERS, ['*'], ['correo' => $correo, 'contrasena' => $contrasena]);
      return $user;
    } catch (\Exception $e) {
      return $e->getMessage();
    }
  }
}
