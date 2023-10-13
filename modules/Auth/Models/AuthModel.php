<?php

namespace Module\Auth\Models;

use Core\MysqlPDO;

class AuthModel
{
  const TABLE = 'auth';

  static public function index()
  {
    return MysqlPDO::find(self::TABLE);
  }

  static public function insert($data)
  {
    return MysqlPDO::insert(self::TABLE, $data);
  }

  static public function login($email, $password)
  {
    $user = MysqlPDO::findOne(self::TABLE, ['*'], ['email' => $email]);
    if ($user) {
      if (password_verify($password, $user['password'])) {
        return $user;
      }
    }
    return false;
  }

}
