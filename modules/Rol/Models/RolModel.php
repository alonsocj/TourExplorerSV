<?php

namespace Module\Rol\Models;

use Core\MysqlPDO;

class RolModel
{
  const TABLE = 'roles';

  static public function getRolById ($id) {
    try {
      $rol = MysqlPDO::findOne(self::TABLE, ['*'], ['id_rol' => $id]);
      return $rol;
    } catch (\Exception $e) {
      return null;
    }
  }
}
