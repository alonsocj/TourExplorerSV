<?php 

  namespace Module\Tour\Models;
  
  use Core\MysqlPDO;

  class TourModel {
    const TABLE = 'tours';

    static public function index() {
      return MysqlPDO::find(self::TABLE);
    }

    static public function insert($data) {
      return MysqlPDO::insert(self::TABLE, $data);
    }
  }