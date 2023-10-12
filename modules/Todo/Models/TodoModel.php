<?php 

  namespace Module\Todo\Models;
  use Core\MysqlPDO;
  class TodoModel {
    const TABLE = 'todos';

    static public function index() {
      return MysqlPDO::find(self::TABLE);
    }

    static public function insert($data) {
      return MysqlPDO::insert(self::TABLE, $data);
    }
  }