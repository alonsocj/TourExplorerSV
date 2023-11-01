<?php 

  namespace Module\Place\Models;
  
  use Core\MysqlPDO;

  class PlaceModel {
    const TABLE = 'lugares';

    static public function index() {
      return MysqlPDO::find(self::TABLE);
    }

    static public function insert($data) {
      return MysqlPDO::insert(self::TABLE, $data);
    }
  }